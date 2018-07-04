class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user, foreign_key: true, index: true, unique: true

      t.timestamps
    end
  end
end
