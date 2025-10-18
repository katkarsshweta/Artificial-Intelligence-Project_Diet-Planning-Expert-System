"""
Database models for the diet planner application.
"""
from datetime import datetime

from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

# Initialize SQLAlchemy
db = SQLAlchemy()


class User(UserMixin, db.Model):
    """User model for authentication and profile data."""
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, nullable=False, index=True)
    email = db.Column(db.String(120), unique=True, nullable=False, index=True)
    password_hash = db.Column(db.String(256), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    # Optional profile information
    first_name = db.Column(db.String(64))
    last_name = db.Column(db.String(64))
    age = db.Column(db.Integer)
    gender = db.Column(db.String(20))
    weight = db.Column(db.Float)
    height = db.Column(db.Float)

    def set_password(self, password):
        """Create hashed password."""
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        """Check hashed password."""
        return check_password_hash(self.password_hash, password)

    def __repr__(self):
        return f'<User {self.username}>'


class UserPreference(db.Model):
    """User dietary preferences and health conditions."""
    __tablename__ = 'user_preferences'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    preference_type = db.Column(db.String(50), nullable=False)  # 'diet_preference' or 'health_condition'
    preference_value = db.Column(db.String(100), nullable=False)

    # Relationship to user
    user = db.relationship('User', backref=db.backref('preferences', lazy=True))

    def __repr__(self):
        return f'<UserPreference {self.preference_type}: {self.preference_value}>'


class SavedDietPlan(db.Model):
    """Saved diet plans for users."""
    __tablename__ = 'saved_diet_plans'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    plan_data = db.Column(db.JSON, nullable=False)

    # Relationship to user
    user = db.relationship('User', backref=db.backref('diet_plans', lazy=True))

    def __repr__(self):
        return f'<SavedDietPlan {self.name}>'