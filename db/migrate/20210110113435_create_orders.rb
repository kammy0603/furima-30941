class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :purchase,      foreign_key: true
      t.string  :postal_code,      null:false
      t.integer :prefecture,       null:false
      t.string  :municipalities,   null:false
      t.string  :address,          null:false
      t.string  :building_number
      t.string  :phone_number,     null:false
      t.timestamps
    end
  end
end
