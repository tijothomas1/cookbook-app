class ChangePriceOfRecipesToDecimal < ActiveRecord::Migration
  def change
    change_column :recipes, :price, :decimal, precision:8, scale: 2
  end
end
