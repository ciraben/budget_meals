class Meal < ApplicationRecord
  has_many :recipe_components
  validates :name, presence: true

  def recipe
    self.recipe_components.map do |component|
      {
        ingredient: component.ingredient.name,
        amount: format_quantity(component.amount),
        unit: component.ingredient.unit,
        cost: component.ingredient.price_per_unit * component.amount
      }
    end
    .sort_by { |dict| dict[:cost] }
    .reverse
  end

  private

  def format_quantity(qty)
    qty.to_r.denominator == 1 ? qty.to_i : qty.to_r
  end
end
