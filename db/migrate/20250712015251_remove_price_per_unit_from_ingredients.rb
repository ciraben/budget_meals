class RemovePricePerUnitFromIngredients < ActiveRecord::Migration[8.0]
  def change
    remove_column :ingredients, :price_per_unit, :decimal
  end
end
