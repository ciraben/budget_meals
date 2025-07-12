raw = %(PASTE HERE)

meal_re = /([a-z\_]+)\: \{([a-z0-9\:\s\_\,\.]+)\}/
meals = raw.scan meal_re
meals.each { |m| parse_match m }

def parse_name(name)
  name.split("_").map{|w| w.capitalize}.join(" ")
end

def parse_match(match)
  meal_name = parse_name match[0]
  meal = Meal.find_or_create_by name: meal_name

  ing_re = /([a-z\_]+)\: ([0-9\.]+)/

  match[1].scan(ing_re).each do |m|
    ing_name = parse_name m[0]
    ing_amt = m[1][0] == "." ? "0" << m[1] : m[1]
    ingredient = Ingredient.create_or_find_by(name: ing_name)

    RecipeComponent.create(
      amount: ing_amt,
      ingredient_id: ingredient.id,
      meal_id: meal.id
    )
  end
end
