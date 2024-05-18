class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.float :weight, null: false
      t.references :storage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
