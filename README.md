# dieT : A Diet Planning Expert System

## Technologies & Tools

![Backend](https://img.shields.io/badge/Backend-Python%20%28Flask%29-blue?style=for-the-badge&logo=python)
![Knowledge Representation](https://img.shields.io/badge/Knowledge%20Representation-Prolog-red?style=for-the-badge&logo=swipl)
![Database](https://img.shields.io/badge/Database-SQLite-lightgrey?style=for-the-badge&logo=sqlite)
![AI Integration](https://img.shields.io/badge/AI-Google%20Gemini-purple?style=for-the-badge)
![Frontend](https://img.shields.io/badge/Frontend-HTML%2C%20CSS%2C%20JavaScript-blue?style=for-the-badge)
![ORM](https://img.shields.io/badge/ORM-SQLAlchemy-green?style=for-the-badge)

---

## Aim
To represent knowledge using Prolog by implementing a small expert system for personalized diet planning based on health conditions, dietary preferences, and user profiles.  

---

## 1. Problem Statement
Many individuals struggle to find dietary recommendations tailored to their health conditions and preferences.  
General advice often ignores medical conditions, restrictions, and individual differences.  
This project addresses that by creating an intelligent system for personalized nutrition guidance.  

---

## 2. Introduction
**HealthWiseDiet** is a knowledge-based expert system providing personalized diet recommendations.  
It integrates **rule-based reasoning via Prolog** with **Python Flask web application**, and enhances insights using **Google Gemini AI**.  
Supports users with **diabetes, hypertension, heart disease, obesity**, and dietary preferences like **vegetarian and vegan**.  

---

## 3. Modules & Features

### 1. User Authentication & Profile Management
- Registration & Login with secure authentication  
- Profile Editing to update health information and preferences  
- Session Management using Flask-Login  

### 2. Rule-Based Diet Recommendation Engine
- **Prolog Knowledge Base (`kb.pl`)** encodes nutrition rules and condition-based guidelines  
- Python-Prolog integration via **PySwip**  
- Personalized recommendations based on age, gender, BMI, health conditions, and diet type  

### 3. AI-Enhanced Advice
- **Gemini AI (`gemini_ai.py`)** provides health insights, meal timing tips, and lifestyle suggestions  

### 4. Personalized Meal Plan Generation
- Structured daily meal plans (breakfast, lunch, dinner, snacks)  
- Randomized balanced meals for variety  

### 5. Plan Management
- Save, view, and delete personalized plans  

### 6. UI & Experience
- Flask HTML templates for smooth navigation  
- Feedback & notifications for user actions  

### 7. Database Management
- **SQLAlchemy ORM** for secure storage of user data, preferences, and saved plans  

---

## 4. Dataset Information
**Prolog Knowledge Base (`kb.pl`)** derived from Kaggle datasets:  
- Nutritional Facts of Common Foods  
- Nutritional Food Facts  
- Food Suitable for Diabetes  
- Daily Meal Nutrition and Diseases  

**Dataset Features:**  
- 200+ food items categorized by health impact & nutrition  
- Rules for diabetes, hypertension, heart disease, obesity  
- Food classification for vegetarian, vegan, non-veg  
- Age and BMI-based recommendations  
- Focused on **Indian cuisine**  

---

## 5. Code Overview
| File | Description |
|------|--------------|
| `app.py` | Flask application and routes |
| `kb.pl` | Prolog knowledge base defining rules |
| `diet_planner.py` | Python-Prolog interface for recommendations |
| `gemini_ai.py` | AI-enhanced insights via Gemini API |
| `models.py` | Database models for users and plans |
| `forms.py` | Web form handling and validation |

---

## 6. Results
- Personalized diet recommendations based on health, preferences, age, BMI, and lifestyle  
- Outputs:  
  1. Lists of recommended & avoided foods  
  2. Structured meal plans (breakfast, lunch, dinner, snacks)  
  3. AI-generated nutrition insights & lifestyle tips  
  4. Personalized advice on meal timing & supplements  

---

## 7. Screenshots
- Home / Landing Page  
- User Registration Page  
- Login Interface  
- Health Profile Input Form  
- Recommendations Page  
- Meal Plan Visualization  
- Saved Plans Dashboard  

---

## 8. Conclusion
**HealthWiseDiet** demonstrates the application of **knowledge representation in Prolog** for real-world health challenges.  
Combining **symbolic AI, web technologies, and AI insights**, it delivers personalized dietary guidance considering complex relationships between health conditions, food properties, and user preferences.  

**Future Enhancements:**  
- Expand knowledge base to cover international cuisines  
- Add nutrient-level reasoning  
- Develop mobile application for wider accessibility  

---
