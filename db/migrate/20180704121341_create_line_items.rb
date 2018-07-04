class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.belongs_to :product, foreign_key: true, index: true
      t.belongs_to :cart, foreign_key: true, index: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
