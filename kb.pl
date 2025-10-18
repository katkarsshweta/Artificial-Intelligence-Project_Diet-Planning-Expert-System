% SWI-Prolog knowledge base for diet recommendations with focus on Indian cuisine

% Facts: health conditions and their allowed/recommended foods
% Format: condition_food(Condition, Food, Recommendation)
% Recommendation: 'recommended' or 'avoid'

% Diabetes recommendations with Indian foods
condition_food(diabetes, jowar, recommended).           % Sorghum
condition_food(diabetes, bajra, recommended).           % Pearl millet
condition_food(diabetes, ragi, recommended).            % Finger millet
condition_food(diabetes, brown_rice, recommended).
condition_food(diabetes, moong_dal, recommended).       % Green gram dal
condition_food(diabetes, masoor_dal, recommended).      % Red lentils
condition_food(diabetes, chana_dal, recommended).       % Bengal gram dal
condition_food(diabetes, palak, recommended).           % Spinach
condition_food(diabetes, methi, recommended).           % Fenugreek leaves
condition_food(diabetes, karela, recommended).          % Bitter gourd
condition_food(diabetes, jamun, recommended).           % Indian blackberry
condition_food(diabetes, amla, recommended).            % Indian gooseberry
condition_food(diabetes, aamras, avoid).                % Mango pulp
condition_food(diabetes, badam, recommended).           % Almonds
condition_food(diabetes, flaxseeds, recommended).       % Flaxseeds
condition_food(diabetes, rohu_fish, recommended).       % Indian carp
condition_food(diabetes, tandoori_chicken, recommended).
condition_food(diabetes, paneer, recommended).          % Indian cottage cheese
condition_food(diabetes, mustard_oil, recommended).
condition_food(diabetes, maida, avoid).                 % White flour
condition_food(diabetes, white_rice, avoid).
condition_food(diabetes, sugary_drinks, avoid).
condition_food(diabetes, jalebi, avoid).                % Sweet Indian dessert
condition_food(diabetes, gulab_jamun, avoid).           % Sweet Indian dessert
condition_food(diabetes, processed_meats, avoid).
condition_food(diabetes, samosa, avoid).                % Fried Indian snack

% Hypertension recommendations with Indian foods
condition_food(hypertension, palak, recommended).            % Spinach
condition_food(hypertension, sarson_ka_saag, recommended).   % Mustard greens
condition_food(hypertension, jamun, recommended).            % Indian blackberry
condition_food(hypertension, kela, recommended).             % Bananas
condition_food(hypertension, chukandar, recommended).        % Beets
condition_food(hypertension, daliya, recommended).           % Broken wheat/porridge
condition_food(hypertension, lahsun, recommended).           % Garlic
condition_food(hypertension, sarson_tel, recommended).       % Mustard oil
condition_food(hypertension, curry_patta, recommended).      % Curry leaves
condition_food(hypertension, hilsa_fish, recommended).       % Hilsa fish
condition_food(hypertension, dahi, recommended).             % Yogurt
condition_food(hypertension, til, recommended).              % Sesame seeds
condition_food(hypertension, akhrot, recommended).           % Walnuts
condition_food(hypertension, aloo, recommended).             % Potatoes
condition_food(hypertension, tamatar, recommended).          % Tomatoes
condition_food(hypertension, tandoori_chicken, recommended). % Tandoori chicken
condition_food(hypertension, processed_foods, avoid).
condition_food(hypertension, namkeen, avoid).                % Indian salty snacks
condition_food(hypertension, papad, avoid).                  % Papadums
condition_food(hypertension, pickle, avoid).                 % Indian pickles
condition_food(hypertension, processed_meats, avoid).
condition_food(hypertension, frozen_meals, avoid).
condition_food(hypertension, alcohol, avoid).
condition_food(hypertension, chai, avoid).                   % Indian tea

% Heart disease recommendations with Indian foods
condition_food(heart_disease, pomfret, recommended).             % Indian fish
condition_food(heart_disease, surmai, recommended).              % Kingfish
condition_food(heart_disease, brown_rice, recommended).
condition_food(heart_disease, millets, recommended).             % Various Indian millets
condition_food(heart_disease, jamun, recommended).               % Indian blackberry
condition_food(heart_disease, mustard_oil, recommended).         % Cold-pressed mustard oil
condition_food(heart_disease, rajma, recommended).               % Kidney beans
condition_food(heart_disease, chana, recommended).               % Chickpeas
condition_food(heart_disease, badam, recommended).               % Almonds
condition_food(heart_disease, akhrot, recommended).              % Walnuts
condition_food(heart_disease, flaxseeds, recommended).           % Flaxseeds
condition_food(heart_disease, palak, recommended).               % Spinach
condition_food(heart_disease, methi, recommended).               % Fenugreek leaves
condition_food(heart_disease, tamatar, recommended).             % Tomatoes
condition_food(heart_disease, lahsun, recommended).              % Garlic
condition_food(heart_disease, tandoori_chicken, recommended).    % Tandoori chicken
condition_food(heart_disease, oats, recommended).
condition_food(heart_disease, green_tea, recommended).
condition_food(heart_disease, dark_chocolate, recommended).
condition_food(heart_disease, pakoras, avoid).                   % Fried Indian snacks
condition_food(heart_disease, bhajias, avoid).                   % Fried fritters
condition_food(heart_disease, mutton, avoid).                    % Indian goat meat
condition_food(heart_disease, processed_meats, avoid).
condition_food(heart_disease, mithai, avoid).                    % Indian sweets
condition_food(heart_disease, namkeen, avoid).                   % Fried savory snacks
condition_food(heart_disease, sugary_drinks, avoid).
condition_food(heart_disease, alcohol, avoid).

% Obesity management recommendations with Indian foods
condition_food(obesity, palak, recommended).            % Spinach
condition_food(obesity, methi, recommended).            % Fenugreek leaves
condition_food(obesity, gobi, recommended).             % Cauliflower
condition_food(obesity, millet, recommended).           % Bajra, jowar, ragi
condition_food(obesity, brown_rice, recommended).
condition_food(obesity, moong_dal, recommended).        % Green gram
condition_food(obesity, chana_dal, recommended).        % Bengal gram
condition_food(obesity, masoor_dal, recommended).       % Red lentils
condition_food(obesity, rajma, recommended).            % Kidney beans
condition_food(obesity, pomfret, recommended).          % Indian fish
condition_food(obesity, jamun, recommended).            % Indian blackberry
condition_food(obesity, amla, recommended).             % Indian gooseberry
condition_food(obesity, seb, recommended).              % Apple
condition_food(obesity, badam, recommended).            % Almonds
condition_food(obesity, chaas, recommended).            % Buttermilk
condition_food(obesity, dahi, recommended).             % Yogurt
condition_food(obesity, egg, recommended).
condition_food(obesity, dal_soup, recommended).         % Lentil soup
condition_food(obesity, nimbu_pani, recommended).       % Lemon water
condition_food(obesity, green_tea, recommended).
condition_food(obesity, ghee, avoid).                   % Clarified butter (in excess)
condition_food(obesity, processed_foods, avoid).
condition_food(obesity, sharbat, avoid).                % Sweet Indian beverages
condition_food(obesity, mithai, avoid).                 % Indian sweets
condition_food(obesity, white_bread, avoid).
condition_food(obesity, pakoras, avoid).                % Fried Indian snacks
condition_food(obesity, samosas, avoid).                % Fried dumplings
condition_food(obesity, parathas, avoid).               % Indian flatbread with ghee
condition_food(obesity, vada_pav, avoid).               % Indian burger
condition_food(obesity, alcohol, avoid).

% Vegetarian diet considerations with Indian foods
condition_food(vegetarian, dal, recommended).              % Various lentils
condition_food(vegetarian, rajma, recommended).            % Kidney beans
condition_food(vegetarian, chole, recommended).            % Chickpeas
condition_food(vegetarian, paneer, recommended).           % Indian cottage cheese
condition_food(vegetarian, tofu, recommended).
condition_food(vegetarian, badam, recommended).            % Almonds
condition_food(vegetarian, kaju, recommended).             % Cashews
condition_food(vegetarian, til, recommended).              % Sesame seeds
condition_food(vegetarian, brown_rice, recommended).
condition_food(vegetarian, roti, recommended).             % Indian flatbread
condition_food(vegetarian, eggs, recommended).
condition_food(vegetarian, dahi, recommended).             % Yogurt
condition_food(vegetarian, chaas, recommended).            % Buttermilk
condition_food(vegetarian, palak, recommended).            % Spinach
condition_food(vegetarian, methi, recommended).            % Fenugreek leaves
condition_food(vegetarian, fortified_foods, recommended).
condition_food(vegetarian, nutritional_yeast, recommended).
condition_food(vegetarian, fruits, recommended).
condition_food(vegetarian, vegetables, recommended).
condition_food(vegetarian, meat, avoid).
condition_food(vegetarian, fish, avoid).
condition_food(vegetarian, poultry, avoid).
condition_food(vegetarian, seafood, avoid).

% Vegan diet considerations with Indian foods
condition_food(vegan, dal, recommended).                   % Various lentils
condition_food(vegan, rajma, recommended).                 % Kidney beans
condition_food(vegan, chole, recommended).                 % Chickpeas
condition_food(vegan, tofu, recommended).
condition_food(vegan, badam, recommended).                 % Almonds
condition_food(vegan, kaju, recommended).                  % Cashews
condition_food(vegan, til, recommended).                   % Sesame seeds
condition_food(vegan, soya_chunks, recommended).           % Soy protein
condition_food(vegan, brown_rice, recommended).
condition_food(vegan, roti, recommended).                  % Indian flatbread
condition_food(vegan, palak, recommended).                 % Spinach
condition_food(vegan, methi, recommended).                 % Fenugreek leaves
condition_food(vegan, soy_milk, recommended).              % Soy milk
condition_food(vegan, coconut_milk, recommended).          % Coconut milk
condition_food(vegan, nutritional_yeast, recommended).
condition_food(vegan, fruits, recommended).
condition_food(vegan, vegetables, recommended).
condition_food(vegan, meat, avoid).
condition_food(vegan, fish, avoid).
condition_food(vegan, poultry, avoid).
condition_food(vegan, seafood, avoid).
condition_food(vegan, eggs, avoid).
condition_food(vegan, paneer, avoid).                      % Indian cottage cheese
condition_food(vegan, dahi, avoid).                        % Yogurt
condition_food(vegan, ghee, avoid).                        % Clarified butter
condition_food(vegan, honey, avoid).

% Age-based recommendations
% children (age < 18)
age_food(child, milk, recommended).
age_food(child, fruits, recommended).
age_food(child, vegetables, recommended).
age_food(child, whole_grains, recommended).
age_food(child, lean_proteins, recommended).
age_food(child, yogurt, recommended).
age_food(child, cheese, recommended).
age_food(child, eggs, recommended).
age_food(child, nuts, recommended).
age_food(child, candy, avoid).
age_food(child, sugary_drinks, avoid).
age_food(child, caffeine, avoid).

% adults (age >= 18 and age < 65)
age_food(adult, fruits, recommended).
age_food(adult, vegetables, recommended).
age_food(adult, whole_grains, recommended).
age_food(adult, lean_proteins, recommended).
age_food(adult, low_fat_dairy, recommended).
age_food(adult, nuts, recommended).
age_food(adult, fish, recommended).
age_food(adult, olive_oil, recommended).
age_food(adult, processed_foods, avoid).
age_food(adult, excessive_alcohol, avoid).
age_food(adult, sugary_drinks, avoid).

% seniors (age >= 65)
age_food(senior, calcium_rich_foods, recommended).
age_food(senior, vitamin_d_foods, recommended).
age_food(senior, protein_rich_foods, recommended).
age_food(senior, fiber_rich_foods, recommended).
age_food(senior, water, recommended).
age_food(senior, fruits, recommended).
age_food(senior, vegetables, recommended).
age_food(senior, whole_grains, recommended).
age_food(senior, fatty_fish, recommended).
age_food(senior, nuts, recommended).
age_food(senior, highly_processed_foods, avoid).
age_food(senior, high_sodium_foods, avoid).
age_food(senior, excessive_alcohol, avoid).

% BMI-based recommendations (bmi)
% underweight (bmi < 18.5)
bmi_food(underweight, protein_rich_foods, recommended).
bmi_food(underweight, healthy_fats, recommended).
bmi_food(underweight, nuts, recommended).
bmi_food(underweight, nut_butters, recommended).
bmi_food(underweight, whole_fat_dairy, recommended).
bmi_food(underweight, starchy_vegetables, recommended).
bmi_food(underweight, whole_grains, recommended).
bmi_food(underweight, fruits, recommended).
bmi_food(underweight, low_calorie_foods, avoid).
bmi_food(underweight, diet_foods, avoid).

% normal weight (bmi >= 18.5 and bmi < 25)
bmi_food(normal, balanced_diet, recommended).
bmi_food(normal, fruits, recommended).
bmi_food(normal, vegetables, recommended).
bmi_food(normal, whole_grains, recommended).
bmi_food(normal, lean_proteins, recommended).
bmi_food(normal, healthy_fats, recommended).
bmi_food(normal, excessive_junk_food, avoid).
bmi_food(normal, sugary_drinks, avoid).

% overweight (bmi >= 25 and bmi < 30)
bmi_food(overweight, vegetables, recommended).
bmi_food(overweight, fruits, recommended).
bmi_food(overweight, lean_proteins, recommended).
bmi_food(overweight, whole_grains, recommended).
bmi_food(overweight, water, recommended).
bmi_food(overweight, high_calorie_foods, avoid).
bmi_food(overweight, sugary_foods, avoid).
bmi_food(overweight, processed_foods, avoid).
bmi_food(overweight, sugary_drinks, avoid).

% obese (bmi >= 30)
bmi_food(obese, vegetables, recommended).
bmi_food(obese, fruits, recommended).
bmi_food(obese, lean_proteins, recommended).
bmi_food(obese, fiber_rich_foods, recommended).
bmi_food(obese, water, recommended).
bmi_food(obese, portion_control, recommended).
bmi_food(obese, high_calorie_foods, avoid).
bmi_food(obese, sugary_foods, avoid).
bmi_food(obese, processed_foods, avoid).
bmi_food(obese, sugary_drinks, avoid).
bmi_food(obese, fried_foods, avoid).

% Gender-based recommendations
gender_food(male, protein_rich_foods, recommended).
gender_food(male, zinc_rich_foods, recommended).
gender_food(male, vegetables, recommended).
gender_food(male, fruits, recommended).
gender_food(male, whole_grains, recommended).
gender_food(male, healthy_fats, recommended).
gender_food(male, excessive_alcohol, avoid).
gender_food(male, excessive_red_meat, avoid).

gender_food(female, iron_rich_foods, recommended).
gender_food(female, calcium_rich_foods, recommended).
gender_food(female, folate_rich_foods, recommended).
gender_food(female, vegetables, recommended).
gender_food(female, fruits, recommended).
gender_food(female, whole_grains, recommended).
gender_food(female, lean_proteins, recommended).
gender_food(female, excessive_alcohol, avoid).
gender_food(female, excessive_caffeine, avoid).

% Foods belong to food groups (for meal planning)
% Indian grains and cereals
food_group(brown_rice, grains).
food_group(white_rice, grains).
food_group(jowar, grains).              % Sorghum
food_group(bajra, grains).              % Pearl millet
food_group(ragi, grains).               % Finger millet
food_group(millet, grains).
food_group(daliya, grains).             % Broken wheat
food_group(oats, grains).
food_group(quinoa, grains).
food_group(whole_grains, grains).
food_group(white_bread, grains).
food_group(roti, grains).               % Indian flatbread
food_group(parathas, grains).           % Stuffed flatbread

% Indian vegetables
food_group(palak, vegetables).             % Spinach
food_group(methi, vegetables).             % Fenugreek leaves
food_group(sarson_ka_saag, vegetables).    % Mustard greens
food_group(curry_patta, vegetables).       % Curry leaves
food_group(leafy_greens, vegetables).
food_group(gobi, vegetables).              % Cauliflower
food_group(broccoli, vegetables).
food_group(chukandar, vegetables).         % Beetroot
food_group(beets, vegetables).
food_group(cruciferous_vegetables, vegetables).
food_group(tamatar, vegetables).           % Tomatoes
food_group(tomatoes, vegetables).
food_group(aloo, vegetables).              % Potatoes
food_group(potatoes, vegetables).
food_group(karela, vegetables).            % Bitter gourd
food_group(bhindi, vegetables).            % Okra/Lady's finger
food_group(baigan, vegetables).            % Eggplant
food_group(lauki, vegetables).             % Bottle gourd
food_group(tinda, vegetables).             % Indian squash
food_group(starchy_vegetables, vegetables).
food_group(vegetables, vegetables).

% Indian fruits
food_group(jamun, fruits).              % Indian blackberry
food_group(amla, fruits).               % Indian gooseberry
food_group(seb, fruits).                % Apple
food_group(apples, fruits).
food_group(santara, fruits).            % Indian orange
food_group(mosambi, fruits).            % Sweet lime
food_group(citrus_fruits, fruits).
food_group(kela, fruits).               % Banana
food_group(bananas, fruits).
food_group(avocados, fruits).
food_group(aam, fruits).                % Mango
food_group(anaar, fruits).              % Pomegranate
food_group(chiku, fruits).              % Sapodilla
food_group(papita, fruits).             % Papaya
food_group(berries, fruits).
food_group(fruits, fruits).

% Indian protein sources
food_group(moong_dal, proteins).        % Green gram
food_group(masoor_dal, proteins).       % Red lentils
food_group(chana_dal, proteins).        % Bengal gram
food_group(toor_dal, proteins).         % Pigeon pea
food_group(urad_dal, proteins).         % Black gram
food_group(rajma, proteins).            % Kidney beans
food_group(chole, proteins).            % Chickpeas
food_group(lentils, proteins).
food_group(beans, proteins).
food_group(badam, proteins).            % Almonds 
food_group(kaju, proteins).             % Cashews
food_group(akhrot, proteins).           % Walnuts
food_group(nuts, proteins).
food_group(til, proteins).              % Sesame seeds
food_group(flaxseeds, proteins).        % Flaxseeds
food_group(seeds, proteins).
food_group(paneer, proteins).           % Indian cottage cheese
food_group(rohu_fish, proteins).        % Indian carp
food_group(pomfret, proteins).          % Indian pomfret
food_group(hilsa_fish, proteins).       % Hilsa fish
food_group(surmai, proteins).           % Kingfish
food_group(fatty_fish, proteins).
food_group(fish, proteins).
food_group(tandoori_chicken, proteins).
food_group(chicken, proteins).
food_group(lean_chicken, proteins).
food_group(mutton, proteins).           % Goat meat
food_group(lean_proteins, proteins).
food_group(tofu, proteins).
food_group(soya_chunks, proteins).      % Soy protein
food_group(tempeh, proteins).
food_group(seitan, proteins).
food_group(eggs, proteins).
food_group(protein_rich_foods, proteins).
food_group(meat, proteins).
food_group(poultry, proteins).
food_group(seafood, proteins).
food_group(red_meat, proteins).
food_group(processed_meats, proteins).

% Indian dairy products
food_group(dahi, dairy).                % Yogurt
food_group(chaas, dairy).               % Buttermilk
food_group(lassi, dairy).               % Yogurt drink
food_group(paneer, dairy).              % Indian cottage cheese
food_group(ghee, dairy).                % Clarified butter
food_group(milk, dairy).
food_group(low_fat_dairy, dairy).
food_group(yogurt, dairy).
food_group(plain_yogurt, dairy).
food_group(cheese, dairy).
food_group(dairy, dairy).
food_group(whole_fat_dairy, dairy).
food_group(soy_milk, dairy).
food_group(coconut_milk, dairy).
food_group(fortified_plant_milk, dairy).

food_group(olive_oil, fats).
food_group(healthy_fats, fats).
food_group(nut_butters, fats).

food_group(water, beverages).
food_group(green_tea, beverages).
food_group(sugary_drinks, beverages).
food_group(alcohol, beverages).
food_group(caffeine, beverages).
food_group(excessive_alcohol, beverages).
food_group(excessive_caffeine, beverages).

food_group(candy, snacks).
food_group(pastries, snacks).
food_group(salty_snacks, snacks).
food_group(processed_snacks, snacks).
food_group(dark_chocolate, snacks).
food_group(sweets, snacks).

food_group(garlic, other).
food_group(processed_foods, other).
food_group(canned_soups, other).
food_group(frozen_meals, other).
food_group(fried_foods, other).
food_group(fast_food, other).
food_group(baked_goods, other).
food_group(soups, other).
food_group(nutritional_yeast, other).
food_group(fortified_foods, other).
food_group(calcium_rich_foods, other).
food_group(vitamin_d_foods, other).
food_group(fiber_rich_foods, other).
food_group(highly_processed_foods, other).
food_group(high_sodium_foods, other).
food_group(balanced_diet, other).
food_group(high_calorie_foods, other).
food_group(low_calorie_foods, other).
food_group(diet_foods, other).
food_group(sugary_foods, other).
food_group(portion_control, other).
food_group(zinc_rich_foods, other).
food_group(iron_rich_foods, other).
food_group(folate_rich_foods, other).
food_group(legumes, other).
food_group(excessive_red_meat, other).
food_group(honey, other).

% Rules

% Get age category
age_category(Age, child) :- Age < 18.
age_category(Age, adult) :- Age >= 18, Age < 65.
age_category(Age, senior) :- Age >= 65.

% Get BMI category
bmi_category(BMI, underweight) :- BMI < 18.5.
bmi_category(BMI, normal) :- BMI >= 18.5, BMI < 25.
bmi_category(BMI, overweight) :- BMI >= 25, BMI < 30.
bmi_category(BMI, obese) :- BMI >= 30.

% Recommended foods based on a condition
recommended_foods_for_condition(Condition, Foods) :-
    findall(Food, condition_food(Condition, Food, recommended), Foods).

% Foods to avoid based on a condition
avoid_foods_for_condition(Condition, Foods) :-
    findall(Food, condition_food(Condition, Food, avoid), Foods).

% Recommended foods based on age
recommended_foods_for_age(Age, Foods) :-
    age_category(Age, Category),
    findall(Food, age_food(Category, Food, recommended), Foods).

% Foods to avoid based on age
avoid_foods_for_age(Age, Foods) :-
    age_category(Age, Category),
    findall(Food, age_food(Category, Food, avoid), Foods).

% Recommended foods based on BMI
recommended_foods_for_bmi(BMI, Foods) :-
    bmi_category(BMI, Category),
    findall(Food, bmi_food(Category, Food, recommended), Foods).

% Foods to avoid based on BMI
avoid_foods_for_bmi(BMI, Foods) :-
    bmi_category(BMI, Category),
    findall(Food, bmi_food(Category, Food, avoid), Foods).

% Recommended foods based on gender
recommended_foods_for_gender(Gender, Foods) :-
    findall(Food, gender_food(Gender, Food, recommended), Foods).

% Foods to avoid based on gender
avoid_foods_for_gender(Gender, Foods) :-
    findall(Food, gender_food(Gender, Food, avoid), Foods).

% Get all recommended foods based on multiple conditions, age, BMI, and gender
get_all_recommended_foods(Conditions, Age, BMI, Gender, Foods) :-
    % Get recommendations from all conditions
    findall(CondFood, (
        member(Cond, Conditions),
        recommended_foods_for_condition(Cond, CondFoods),
        member(CondFood, CondFoods)
    ), ConditionFoods),
    
    % Get age-based recommendations
    recommended_foods_for_age(Age, AgeFoods),
    
    % Get BMI-based recommendations
    recommended_foods_for_bmi(BMI, BmiFoods),
    
    % Get gender-based recommendations
    recommended_foods_for_gender(Gender, GenderFoods),
    
    % Combine all recommendations and remove duplicates
    append(ConditionFoods, AgeFoods, Temp1),
    append(Temp1, BmiFoods, Temp2),
    append(Temp2, GenderFoods, AllFoods),
    sort(AllFoods, Foods).

% Get all foods to avoid based on multiple conditions, age, BMI, and gender
get_all_avoid_foods(Conditions, Age, BMI, Gender, Foods) :-
    % Get foods to avoid from all conditions
    findall(CondFood, (
        member(Cond, Conditions),
        avoid_foods_for_condition(Cond, CondFoods),
        member(CondFood, CondFoods)
    ), ConditionFoods),
    
    % Get age-based foods to avoid
    avoid_foods_for_age(Age, AgeFoods),
    
    % Get BMI-based foods to avoid
    avoid_foods_for_bmi(BMI, BmiFoods),
    
    % Get gender-based foods to avoid
    avoid_foods_for_gender(Gender, GenderFoods),
    
    % Combine all foods to avoid and remove duplicates
    append(ConditionFoods, AgeFoods, Temp1),
    append(Temp1, BmiFoods, Temp2),
    append(Temp2, GenderFoods, AllFoods),
    sort(AllFoods, Foods).

% Combine recommendations considering preferences
apply_preferences(RecommendedFoods, AvoidFoods, Preferences, FinalRecommended, FinalAvoid) :-
    % For vegetarian preference, add meat to avoid
    (member(vegetarian, Preferences) ->
        avoid_foods_for_condition(vegetarian, VegAvoid),
        append(AvoidFoods, VegAvoid, AvoidTemp1),
        recommended_foods_for_condition(vegetarian, VegRecommend),
        append(RecommendedFoods, VegRecommend, RecommendTemp1),
        sort(AvoidTemp1, AvoidTemp1Unique),
        sort(RecommendTemp1, RecommendTemp1Unique)
    ;
        AvoidTemp1Unique = AvoidFoods,
        RecommendTemp1Unique = RecommendedFoods
    ),
    
    % For vegan preference, add animal products to avoid
    (member(vegan, Preferences) ->
        avoid_foods_for_condition(vegan, VeganAvoid),
        append(AvoidTemp1Unique, VeganAvoid, AvoidTemp2),
        recommended_foods_for_condition(vegan, VeganRecommend),
        append(RecommendTemp1Unique, VeganRecommend, RecommendTemp2),
        sort(AvoidTemp2, FinalAvoid),
        sort(RecommendTemp2, FinalRecommended)
    ;
        FinalAvoid = AvoidTemp1Unique,
        FinalRecommended = RecommendTemp1Unique
    ).

% Generate diet plan
generate_diet_plan(Conditions, Preferences, Age, Gender, BMI, RecommendedFoods, AvoidFoods) :-
    % Get base recommendations
    get_all_recommended_foods(Conditions, Age, BMI, Gender, BaseRecommended),
    get_all_avoid_foods(Conditions, Age, BMI, Gender, BaseAvoid),
    
    % Apply dietary preferences
    apply_preferences(BaseRecommended, BaseAvoid, Preferences, RecommendedFoods, AvoidFoods).

% Generate meal plan: get foods by group for balanced meals
foods_by_group(Foods, Group, GroupFoods) :-
    findall(Food, (
        member(Food, Foods),
        food_group(Food, Group)
    ), GroupFoods).
