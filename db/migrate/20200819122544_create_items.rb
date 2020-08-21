class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :item, null: false
      t.string :introduce, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :area_id, null: false
      t.integer :days_until_shipping_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
    end
  end
end