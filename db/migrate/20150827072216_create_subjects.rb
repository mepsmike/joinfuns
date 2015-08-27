class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|

      t.timestamps null: false
      t.string :title
      t.string :cover
      t.string :link
      t.string :address
      t.decimal :price
      t.string :end_time
      t.string :phone
      t.string :email
      t.text :description
    end
  end
end
