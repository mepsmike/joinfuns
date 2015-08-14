class ChangeColumnTypePriceAndLatlng < ActiveRecord::Migration
  def change
    change_column :prices, :price, :decimal
    change_column :events, :latitude, :decimal
    change_column :events, :longitude, :decimal
  end
end
