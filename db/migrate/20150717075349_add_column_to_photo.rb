class AddColumnToPhoto < ActiveRecord::Migration
  def change
  	add_attachment :photos, :pic
  end
end
