class ChangePriceOfRecipes < ActiveRecord::Migration
  def change
    change_column :recipes, :price, :integer
  end
end
