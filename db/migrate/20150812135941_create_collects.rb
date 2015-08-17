class CreateCollects < ActiveRecord::Migration
  def change
    create_table :collects do |t|

      t.timestamps null: false
      t.integer :event_id
      t.integer :user_id
    end

    add_index :collects, :user_id
    add_index :collects, :event_id
  end
end
