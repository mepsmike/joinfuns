class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|

      t.timestamps null: false
      t.integer :event_id
    end
  end
end
