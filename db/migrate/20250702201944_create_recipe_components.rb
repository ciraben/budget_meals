class CreateRecipeComponents < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_components do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
