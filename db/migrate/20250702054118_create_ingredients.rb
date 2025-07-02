class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :price_per_unit
      t.string :unit

      t.timestamps
    end
  end
end
