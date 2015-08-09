class AddMissingColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :organizer, :string
    add_column :events, :website, :string
    add_column :events, :email, :string
    add_column :events, :type_cd, :string
  end
end
