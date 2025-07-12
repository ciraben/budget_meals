class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  after_save :change_blank_price_to_zero
  after_save :change_blank_quantity_to_one
  after_create :change_blank_units_to_tbd

  def price_per_unit
    price / quantity
  end

  private

  def change_blank_price_to_zero
    self.price = price.presence || 0
  end

  def change_blank_quantity_to_one
    self.quantity = quantity.presence || 1
  end

  def change_blank_units_to_tbd
    self.unit = unit.presence || "tbd"
  end
end
