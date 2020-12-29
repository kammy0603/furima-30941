class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,                  null: false
      t.text :introduction,            null: false
      t.integer :category_id,          null: false
      t.integer :item_status_id,       null: false
      t.integer :distribution_fee_id,  null: false
      t.integer :region_id,            null: false
      t.integer :distribution_term_id, null: false
      t.integer :price,                null: false
      t.references :user,              foreign_key: true

    end
  end
end
