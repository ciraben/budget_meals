class Meal < ApplicationRecord
  has_many :recipe_components
  validates :name, presence: true

  def recipe
    self.recipe_components
    .sort_by { |component| component.cost }
    .reverse
  end

  def total_cost
    self.recipe.map { |component| component.cost }
    .sum
  end
end
