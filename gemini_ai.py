"""
Gemini AI module for health condition based diet planner.
This module provides functions to get AI-enhanced diet recommendations
based on user health data and initial Prolog recommendations.
"""

import os
import logging
import google.generativeai as genai

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Configure Gemini AI
try:
    GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY")
    if GEMINI_API_KEY:
        genai.configure(api_key=GEMINI_API_KEY)
except Exception as e:
    logger.error(f"Error configuring Gemini AI: {str(e)}")

def get_gemini_diet_advice(user_data, prolog_recommendations):
    """
    Get additional diet advice from Google's Gemini AI based on user data and initial Prolog recommendations
    
    Args:
        user_data (dict): User health data (age, weight, height, gender, conditions, etc.)
        prolog_recommendations (dict): Recommendations from the Prolog expert system
        
    Returns:
        dict: Additional insights and personalized advice
    """
    try:
        if not GEMINI_API_KEY:
            logger.warning("No Gemini API key found. Skipping AI analysis.")
            return {"error": "No Gemini API key configured."}
        
        # Format the user data and recommendations for the prompt
        age = user_data.get('age', 'N/A')
        weight = user_data.get('weight', 'N/A')
        height = user_data.get('height', 'N/A')
        gender = user_data.get('gender', 'N/A')
        bmi = user_data.get('bmi', 'N/A')
        conditions = ', '.join(user_data.get('conditions', [])) or 'None'
        preferences = ', '.join(user_data.get('preferences', [])) or 'None'
        
        # Add the additional health data
        activity_level = user_data.get('activity_level', 'N/A')
        sleep_hours = user_data.get('sleep_hours', 'N/A')
        stress_level = user_data.get('stress_level', 'N/A')
        water_intake = user_data.get('water_intake', 'N/A')
        allergies = ', '.join(user_data.get('allergies', [])) or 'None'
        meal_timing = user_data.get('meal_timing', 'N/A')
        goals = ', '.join(user_data.get('goals', [])) or 'None'
        supplements = ', '.join(user_data.get('supplements', [])) or 'None'
        
        # Format the Prolog recommendations
        recommended_foods = ', '.join(prolog_recommendations.get('recommended', [])) or 'None'
        foods_to_avoid = ', '.join(prolog_recommendations.get('avoid', [])) or 'None'
        
        # Construct the prompt for Gemini
        prompt = f"""
        You are a nutritionist and diet expert. Analyze the following user health data and provide personalized diet advice:
        
        USER HEALTH PROFILE:
        - Age: {age}
        - Gender: {gender}
        - Weight: {weight} kg
        - Height: {height} cm
        - BMI: {bmi}
        - Health Conditions: {conditions}
        - Dietary Preferences: {preferences}
        - Activity Level: {activity_level}
        - Sleep Hours: {sleep_hours}
        - Stress Level: {stress_level}
        - Water Intake: {water_intake}
        - Food Allergies/Intolerances: {allergies}
        - Meal Timing Preference: {meal_timing}
        - Health Goals: {goals}
        - Current Supplements: {supplements}
        
        INITIAL DIET RECOMMENDATIONS (from Prolog expert system):
        - Recommended Foods: {recommended_foods}
        - Foods to Avoid: {foods_to_avoid}
        
        Please provide:
        1. A brief analysis of the user's health profile (100-150 words)
        2. 3-5 key nutritional insights specifically customized for this user
        3. 3-5 lifestyle tips to complement the diet recommendations
        4. Specific advice on meal timing based on their preference
        5. Advice on supplements they should consider based on their profile
        
        Return your response in a structured format that can be easily parsed.
        """
        
        # Generate response from Gemini
        model = genai.GenerativeModel('gemini-pro')
        response = model.generate_content(prompt)
        
        # Process the response
        if hasattr(response, 'text'):
            response_text = response.text
            
            # Extract sections from the AI response (simple parsing)
            sections = response_text.split('\n\n')
            
            analysis = next((s for s in sections if "analysis" in s.lower()), "")
            analysis = analysis.replace("Analysis:", "").strip()
            
            nutritional_insights = []
            for section in sections:
                if "nutritional insights" in section.lower():
                    insights_text = section.split('\n')[1:]  # Skip the header
                    for insight in insights_text:
                        if insight.strip() and any(c.isalpha() for c in insight):
                            # Clean up numbering and formatting
                            clean_insight = insight.strip()
                            if clean_insight[0].isdigit() and clean_insight[1] in [')', '.', ':']:
                                clean_insight = clean_insight[2:].strip()
                            nutritional_insights.append(clean_insight)
            
            lifestyle_tips = []
            for section in sections:
                if "lifestyle tips" in section.lower():
                    tips_text = section.split('\n')[1:]  # Skip the header
                    for tip in tips_text:
                        if tip.strip() and any(c.isalpha() for c in tip):
                            # Clean up numbering and formatting
                            clean_tip = tip.strip()
                            if clean_tip[0].isdigit() and clean_tip[1] in [')', '.', ':']:
                                clean_tip = clean_tip[2:].strip()
                            lifestyle_tips.append(clean_tip)
            
            meal_timing_advice = ""
            for section in sections:
                if "meal timing" in section.lower():
                    meal_timing_advice = section.replace("Meal Timing Advice:", "").strip()
                    break
            
            supplement_advice = ""
            for section in sections:
                if "supplement" in section.lower():
                    supplement_advice = section.replace("Supplement Advice:", "").strip()
                    break
            
            # Return formatted insights
            return {
                "analysis": analysis,
                "nutritional_insights": nutritional_insights,
                "lifestyle_tips": lifestyle_tips,
                "meal_timing_advice": meal_timing_advice,
                "supplement_advice": supplement_advice
            }
        else:
            logger.error("No text in Gemini response")
            return {"error": "Failed to get meaningful response from AI."}
            
    except Exception as e:
        logger.error(f"Error getting Gemini diet advice: {str(e)}")
        return {"error": str(e)}