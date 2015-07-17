class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :cell_phone, :string
  	add_column :users, :birthday, :string
  end
end
