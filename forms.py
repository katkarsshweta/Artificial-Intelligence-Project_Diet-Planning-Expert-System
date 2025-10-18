"""
Forms for the diet planner application.
"""
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, IntegerField, FloatField, SelectField
from wtforms.validators import DataRequired, Email, EqualTo, Length, Optional, ValidationError

from models import User


class LoginForm(FlaskForm):
    """Form for user login."""
    username = StringField('Username', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember Me')
    submit = SubmitField('Sign In')


class RegistrationForm(FlaskForm):
    """Form for user registration."""
    username = StringField('Username', validators=[DataRequired(), Length(min=3, max=64)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=8)])
    password2 = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    first_name = StringField('First Name', validators=[Optional(), Length(max=64)])
    last_name = StringField('Last Name', validators=[Optional(), Length(max=64)])
    age = IntegerField('Age', validators=[Optional()])
    gender = SelectField('Gender', choices=[('', 'Select...'), ('male', 'Male'), ('female', 'Female'), ('other', 'Other')], validators=[Optional()])
    weight = FloatField('Weight (kg)', validators=[Optional()])
    height = FloatField('Height (cm)', validators=[Optional()])
    submit = SubmitField('Register')

    def validate_username(self, username):
        """Check if username is already taken."""
        user = User.query.filter_by(username=username.data).first()
        if user is not None:
            raise ValidationError('Username already taken. Please choose a different one.')

    def validate_email(self, email):
        """Check if email is already registered."""
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('Email already registered. Please use a different email address or log in.')


class ProfileForm(FlaskForm):
    """Form for updating user profile."""
    first_name = StringField('First Name', validators=[Optional(), Length(max=64)])
    last_name = StringField('Last Name', validators=[Optional(), Length(max=64)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    age = IntegerField('Age', validators=[Optional()])
    gender = SelectField('Gender', choices=[('', 'Select...'), ('male', 'Male'), ('female', 'Female'), ('other', 'Other')], validators=[Optional()])
    weight = FloatField('Weight (kg)', validators=[Optional()])
    height = FloatField('Height (cm)', validators=[Optional()])
    submit = SubmitField('Update Profile')

    def __init__(self, original_email, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)
        self.original_email = original_email

    def validate_email(self, email):
        """Check if email is already registered by another user."""
        if email.data != self.original_email:
            user = User.query.filter_by(email=email.data).first()
            if user is not None:
                raise ValidationError('Email already registered. Please use a different email address.')