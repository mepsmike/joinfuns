class ChangeEventTypeToCategoryCd < ActiveRecord::Migration
  def change
    remove_column :events, :event_type
    add_column :events, :category_cd, :integer
  end
end
