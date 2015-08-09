class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.timestamps null: false
      t.text :content
      t.integer :user_id

    end
  end
end
