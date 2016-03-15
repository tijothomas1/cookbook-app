class AddDescriptionAndPriceToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :text
    add_column :recipes, :price, :string
  end
end
