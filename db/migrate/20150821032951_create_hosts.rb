class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|

      t.timestamps null: false
      t.string :address
      t.string :website
      t.string :tel
      t.string :email
      t.text :description
    end
  end
end
