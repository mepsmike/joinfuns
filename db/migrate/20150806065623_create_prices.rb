class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|

      t.timestamps null: false
      t.integer :event_id
      t.integer :price1
      t.integer :price2
      t.integer :price3

    end
  end
end
