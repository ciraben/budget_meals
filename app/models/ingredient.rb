class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  after_save :change_blank_ppu_to_zero
  after_create :change_blank_units_to_tbd

  private

  def change_blank_ppu_to_zero
    self.price_per_unit = price_per_unit.presence || 0
  end

  def change_blank_units_to_tbd
    self.unit = unit.presence || "tbd"
  end
end
