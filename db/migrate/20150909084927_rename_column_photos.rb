class RenameColumnPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :event_id, :user_id
  end
end
