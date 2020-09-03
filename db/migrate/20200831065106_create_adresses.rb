class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.timestamps
      t.integer :prefecture
      t.string :city
      t.string :postal_code
      t.string :building
      t.string :adress, null: false
      t.string :phon_number, null: false
      t.references :buy, null: false, foreign_key: true
    end
  end
end