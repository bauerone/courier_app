class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :delivery_address
      t.string :shipping_address
      t.references :customer, null: false
      t.references :courier, null: false

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :customer_id, primary_key: :id
    add_foreign_key :orders, :users, column: :courier_id, primary_key: :id
  end
end
