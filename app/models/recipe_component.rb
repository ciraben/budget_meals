class RecipeComponent < ApplicationRecord
  belongs_to :meal
  belongs_to :ingredient

  validates :amount, presence: true
end
