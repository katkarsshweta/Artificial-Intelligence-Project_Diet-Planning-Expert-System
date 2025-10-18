import os
import random
from pyswip import Prolog

# Initialize Prolog
prolog = Prolog()

# Load the knowledge base
def load_knowledge_base():
    """Load the Prolog knowledge base from kb.pl"""
    try:
        kb_path = os.path.abspath(os.path.join(os.path.dirname(__file__), 'kb.pl'))
        kb_path = kb_path.replace("\\", "/")  # Convert Windows backslashes to forward slashes

        print("Knowledge Base Path:", kb_path)

        # Wrap path in single quotes manually and use string Prolog query
        query = f"consult('{kb_path}')"
        list(prolog.query(query))  # Execute the consult query via Prolog
        print("Knowledge base loaded successfully.")
        return True
    except Exception as e:
        print(f"Error loading knowledge base: {e}")
        return False



# Try to load the knowledge base on module import
try:
    load_knowledge_base()
except Exception as e:
    print(f"Warning: Could not load knowledge base: {e}")

def get_diet_recommendations(conditions, preferences, age, gender, bmi):
    """
    Get diet recommendations from the Prolog knowledge base
    
    Args:
        conditions (list): List of health conditions
        preferences (list): List of dietary preferences
        age (int): User's age
        gender (str): User's gender
        bmi (float): User's BMI
        
    Returns:
        dict: Dictionary with recommended and avoided foods
    """
    # Ensure the knowledge base is loaded
    if not list(prolog.query("current_predicate(condition_food/3)")):
        load_knowledge_base()
    
    try:
        # Convert inputs to Prolog format
        prolog_conditions = str(conditions).replace("'", "").replace("[", "[").replace("]", "]")
        prolog_preferences = str(preferences).replace("'", "").replace("[", "[").replace("]", "]")
        
        # Query for diet recommendations
        query = f"generate_diet_plan({prolog_conditions}, {prolog_preferences}, {age}, {gender}, {bmi}, RecommendedFoods, AvoidFoods)"
        
        results = list(prolog.query(query))
        
        if results:
            # Extract the recommended and avoided foods
            recommended_foods = results[0]["RecommendedFoods"]
            avoid_foods = results[0]["AvoidFoods"]
            
            # Format into readable strings
            recommended_foods = [format_food_name(food) for food in recommended_foods]
            avoid_foods = [format_food_name(food) for food in avoid_foods]
            
            return {
                "recommended": recommended_foods,
                "avoid": avoid_foods
            }
        else:
            return {
                "recommended": [],
                "avoid": []
            }
    except Exception as e:
        print(f"Error getting diet recommendations: {e}")
        return {
            "recommended": [],
            "avoid": [],
            "error": str(e)
        }

def format_food_name(name):
    """Convert food names to a more readable format"""
    return name.replace("_", " ").title()

def get_meal_plan(recommendations):
    """
    Generate a meal plan based on recommended foods
    
    Args:
        recommendations (dict): Dictionary with recommended and avoided foods
        
    Returns:
        dict: Meal plan with breakfast, lunch, dinner, and snacks
    """
    try:
        recommended = recommendations.get("recommended", [])
        avoid = recommendations.get("avoid", [])
        
        if not recommended:
            return {}
        
        # Get food categories
        meal_plan = {
            "breakfast": [],
            "lunch": [],
            "dinner": [],
            "snacks": []
        }
        
        # Extract food categories from the knowledge base for recommended foods
        for food in recommended:
            food_lower = food.lower().replace(" ", "_")
            query = f"food_group({food_lower}, Group)"
            results = list(prolog.query(query))
            
            if results:
                group = results[0]["Group"]
                if group == "grains":
                    meal_plan["breakfast"].append(food)
                elif group == "proteins":
                    meal_plan["lunch"].append(food)
                    meal_plan["dinner"].append(food)
                elif group == "vegetables":
                    meal_plan["lunch"].append(food)
                    meal_plan["dinner"].append(food)
                elif group == "fruits":
                    meal_plan["breakfast"].append(food)
                    meal_plan["snacks"].append(food)
                elif group == "dairy":
                    meal_plan["breakfast"].append(food)
                    meal_plan["snacks"].append(food)
                elif group == "fats":
                    # Add fats to different meals
                    pass
                elif group == "snacks":
                    meal_plan["snacks"].append(food)
        
        # Randomize and limit the number of foods per meal
        for meal in meal_plan:
            if meal_plan[meal]:
                random.shuffle(meal_plan[meal])
                meal_plan[meal] = meal_plan[meal][:3]  # Limit to 3 items per meal
        
        return meal_plan
    except Exception as e:
        print(f"Error generating meal plan: {e}")
        return {}
