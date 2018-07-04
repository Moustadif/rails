class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true, unique: true
      t.text :description, null: false
      t.integer :quantity, null: false
      t.decimal :price, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
