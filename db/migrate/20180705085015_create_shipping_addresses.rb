class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.belongs_to :cart, foreign_key: true, index: true

      t.timestamps
    end
  end
end
