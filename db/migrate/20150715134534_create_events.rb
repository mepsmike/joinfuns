class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.timestamps null: false
      t.string :title
      t.string :hoster
      t.string :address
      t.datetime :start_time
      t.datetime :end_time
      t.string :contact_phone
      t.string :cover
      t.text :description
      t.integer :price
    end
  end
end
