"""
Flask application for the dieT planner with user authentication.
"""
import os
import logging
from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from urllib.parse import urlparse
from werkzeug.security import generate_password_hash

from models import db, User, UserPreference, SavedDietPlan
from forms import LoginForm, RegistrationForm, ProfileForm
from diet_planner import get_diet_recommendations, get_meal_plan
from gemini_ai import get_gemini_diet_advice

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Create Flask app
app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get("SESSION_SECRET", "diet-planner-secret-key")
app.config["SQLALCHEMY_DATABASE_URI"] = os.environ.get("DATABASE_URL", "sqlite:///diet_planner.db")
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Initialize database
db.init_app(app)

# Initialize Login Manager
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
login_manager.login_message = 'Please log in to access this page.'
login_manager.login_message_category = 'info'

@login_manager.user_loader
def load_user(user_id):
    """Load user from database."""
    return User.query.get(int(user_id))

# Create database tables if they don't exist
with app.app_context():
    db.create_all()

@app.route('/')
def home():
    """Display the landing page."""
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    return render_template('home.html')

@app.route('/plan')
@login_required
def index():
    """Display the main form for user input."""
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    """Handle user login."""
    # If user is already logged in, redirect to homepage
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    
    form = LoginForm()
    if form.validate_on_submit():
        # Try to get the user from the database
        user = User.query.filter_by(username=form.username.data).first()
        
        # Check if user exists and password is correct
        if user is None or not user.check_password(form.password.data):
            flash('Invalid username or password', 'danger')
            return redirect(url_for('login'))
        
        # Log in the user
        login_user(user, remember=form.remember_me.data)
        
        # Redirect to the page the user was trying to access
        next_page = request.args.get('next')
        if not next_page or urlparse(next_page).netloc != '':
            next_page = url_for('index')
        
        flash(f'Welcome back, {user.username}!', 'success')
        return redirect(next_page)
    
    return render_template('login.html', form=form)

@app.route('/logout')
def logout():
    """Handle user logout."""
    logout_user()
    flash('You have been logged out.', 'info')
    return redirect(url_for('home'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    """Handle user registration."""
    # If user is already logged in, redirect to homepage
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    
    form = RegistrationForm()
    if form.validate_on_submit():
        # Create new user
        user = User(
            username=form.username.data,
            email=form.email.data,
            first_name=form.first_name.data,
            last_name=form.last_name.data,
            age=form.age.data,
            gender=form.gender.data,
            weight=form.weight.data,
            height=form.height.data
        )
        user.set_password(form.password.data)
        
        # Add user to database
        db.session.add(user)
        db.session.commit()
        
        flash('Registration successful! You can now log in.', 'success')
        return redirect(url_for('login'))
    
    return render_template('register.html', form=form)

@app.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    """Display and update user profile."""
    form = ProfileForm(current_user.email)
    
    if form.validate_on_submit():
        current_user.first_name = form.first_name.data
        current_user.last_name = form.last_name.data
        current_user.email = form.email.data
        current_user.age = form.age.data
        current_user.gender = form.gender.data
        current_user.weight = form.weight.data
        current_user.height = form.height.data
        
        db.session.commit()
        flash('Your profile has been updated!', 'success')
        return redirect(url_for('profile'))
    
    elif request.method == 'GET':
        form.first_name.data = current_user.first_name
        form.last_name.data = current_user.last_name
        form.email.data = current_user.email
        form.age.data = current_user.age
        form.gender.data = current_user.gender
        form.weight.data = current_user.weight
        form.height.data = current_user.height
    
    return render_template('profile.html', form=form)

@app.route('/saved_plans')
@login_required
def saved_plans():
    """Display user's saved diet plans."""
    plans = SavedDietPlan.query.filter_by(user_id=current_user.id).order_by(SavedDietPlan.created_at.desc()).all()
    return render_template('saved_plans.html', plans=plans)

@app.route('/view_plan/<int:plan_id>')
@login_required
def view_plan(plan_id):
    """View a saved diet plan."""
    plan = SavedDietPlan.query.filter_by(id=plan_id, user_id=current_user.id).first_or_404()
    return render_template('view_plan.html', plan=plan)

@app.route('/delete_plan/<int:plan_id>', methods=['POST'])
@login_required
def delete_plan(plan_id):
    """Delete a saved diet plan."""
    plan = SavedDietPlan.query.filter_by(id=plan_id, user_id=current_user.id).first_or_404()
    db.session.delete(plan)
    db.session.commit()
    flash('Diet plan deleted successfully!', 'success')
    return redirect(url_for('saved_plans'))

@app.route('/recommendations', methods=['POST'])
@login_required
def recommendations():
    """Process the form and display diet recommendations."""
    try:
        # Get form data
        age = int(request.form.get('age', 0))
        weight = float(request.form.get('weight', 0))
        height = float(request.form.get('height', 0))
        gender = request.form.get('gender', '')
        
        # Get health conditions (multiple checkboxes)
        conditions = request.form.getlist('conditions')
        
        # Dietary preferences
        preferences = request.form.getlist('preferences')
        
        # Calculate BMI
        bmi = 0
        if height > 0:
            bmi = round(weight / ((height/100) ** 2), 1)
        
        # Get additional health analysis data (optional fields)
        activity_level = request.form.get('activity_level', 'moderate')
        sleep_hours = request.form.get('sleep_hours', '')
        stress_level = request.form.get('stress_level', 'moderate')
        water_intake = request.form.get('water_intake', 'moderate')
        allergies = request.form.getlist('allergies')
        meal_timing = request.form.get('meal_timing', 'regular')
        goals = request.form.getlist('goals')
        supplements = request.form.getlist('supplements')
        
        # Create a comprehensive user data dictionary
        user_data = {
            'age': age,
            'weight': weight,
            'height': height,
            'gender': gender,
            'conditions': conditions,
            'preferences': preferences,
            'bmi': bmi,
            'activity_level': activity_level,
            'sleep_hours': sleep_hours,
            'stress_level': stress_level,
            'water_intake': water_intake,
            'allergies': allergies,
            'meal_timing': meal_timing,
            'goals': goals,
            'supplements': supplements
        }
        
        # Log the collected data
        app.logger.debug(f"User data: {user_data}")
        
        # Get diet recommendations from Prolog
        recommendations = get_diet_recommendations(conditions, preferences, age, gender, bmi)
        
        # Generate a meal plan
        meal_plan = get_meal_plan(recommendations)
        
        # Get additional insights from Gemini AI if we have additional data
        ai_analysis = None
        if any([activity_level, sleep_hours, stress_level, water_intake, allergies, meal_timing, goals, supplements]):
            app.logger.info("Getting Gemini AI analysis")
            ai_analysis = get_gemini_diet_advice(user_data, recommendations)
            app.logger.debug(f"AI analysis: {ai_analysis}")
        
        # Store the data in session for potential later use
        session['user_data'] = user_data
        session['recommendations'] = recommendations
        session['meal_plan'] = meal_plan
        session['ai_analysis'] = ai_analysis
        
        # Pass the recommendations and AI analysis to the template
        return render_template('results.html', 
                              recommendations=recommendations,
                              meal_plan=meal_plan,
                              user_data=session['user_data'],
                              ai_analysis=ai_analysis)
    
    except Exception as e:
        app.logger.error(f"Error processing recommendations: {str(e)}")
        flash(f"An error occurred: {str(e)}", "danger")
        return redirect(url_for('index'))

@app.route('/save_plan', methods=['POST'])
@login_required
def save_plan():
    """Save the current diet plan for the logged-in user."""
    try:
        # Check if we have recommendations in the session
        if 'recommendations' not in session or 'meal_plan' not in session:
            flash('No diet plan available to save.', 'warning')
            return redirect(url_for('index'))
        
        # Get plan name and description from form
        plan_name = request.form.get('plan_name', 'My Diet Plan')
        plan_description = request.form.get('plan_description', '')
        
        # Prepare plan data
        plan_data = {
            'recommended': session['recommendations'].get('recommended', []),
            'avoid': session['recommendations'].get('avoid', []),
            'meal_plan': session['meal_plan'],
            'user_data': session['user_data']
        }
        
        # If AI analysis is available, add it to the plan data
        if 'ai_analysis' in session and session['ai_analysis']:
            plan_data['ai_analysis'] = session['ai_analysis']
        
        # Create a new SavedDietPlan object
        new_plan = SavedDietPlan(
            user_id=current_user.id,
            name=plan_name,
            description=plan_description,
            plan_data=plan_data
        )
        
        # Save to database
        db.session.add(new_plan)
        db.session.commit()
        
        flash('Diet plan saved successfully!', 'success')
        return redirect(url_for('saved_plans'))
    
    except Exception as e:
        app.logger.error(f"Error saving diet plan: {str(e)}")
        flash(f"An error occurred while saving the plan: {str(e)}", "danger")
        return redirect(url_for('recommendations'))

@app.errorhandler(404)
def page_not_found(e):
    if current_user.is_authenticated:
        return render_template('index.html'), 404
    return render_template('home.html'), 404

@app.errorhandler(500)
def server_error(e):
    app.logger.error(f"Server error: {str(e)}")
    flash("An internal server error occurred. Please try again later.", "danger")
    if current_user.is_authenticated:
        return render_template('index.html'), 500
    return render_template('home.html'), 500
if __name__ == '__main__':
    app.run(debug=True)
