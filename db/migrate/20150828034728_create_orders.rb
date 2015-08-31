class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.timestamps null: false
      t.string   "name",            limit: 255
      t.string   "email",           limit: 255
      t.string   "phone",           limit: 255
      t.string   "address",         limit: 255
      t.string   "payment_method",  limit: 255
      t.integer  "amount",          limit: 4
      t.integer  "user_id",         limit: 4
      t.string   "payment_status",  limit: 255, default: "pending"
      t.string   "shipping_status", limit: 255, default: "pending"
    end
  end
end
