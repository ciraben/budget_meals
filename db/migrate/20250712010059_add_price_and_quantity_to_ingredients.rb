class AddPriceAndQuantityToIngredients < ActiveRecord::Migration[8.0]
  def change
    add_column :ingredients, :price, :decimal
    add_column :ingredients, :quantity, :integer
  end
end
