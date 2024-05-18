class CreateStorages < ActiveRecord::Migration[7.1]
  def change
    create_table :storages do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
