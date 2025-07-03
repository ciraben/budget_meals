class AddMealAndIngredientRefsToRecipeComponents < ActiveRecord::Migration[8.0]
  def change
    add_reference :recipe_components, :meal, null: false, foreign_key: true
    add_reference :recipe_components, :ingredient, null: false, foreign_key: true
  end
end
