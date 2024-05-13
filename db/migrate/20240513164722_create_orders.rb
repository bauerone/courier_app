class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :delivery_address, null: false
      t.string :shipping_address
      t.integer :status, default: 0
      t.references :customer, null: false
      t.references :courier

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :customer_id, primary_key: :id
    add_foreign_key :orders, :users, column: :courier_id, primary_key: :id
  end
end
