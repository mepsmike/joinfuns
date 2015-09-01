class AddMoneyToUser < ActiveRecord::Migration
  def change
    add_column :users, :money, :decimal, :default=>50
  end
end
