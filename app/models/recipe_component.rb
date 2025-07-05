class RecipeComponent < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient

  validates :amount, presence: true

  def cost
    self.ingredient.price_per_unit * amount
  end
end
