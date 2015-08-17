class RemovePriceColumn < ActiveRecord::Migration
  def change
    remove_column :prices, :price2
    remove_column :prices, :price3
    rename_column :prices, :price1, :price
  end
end
