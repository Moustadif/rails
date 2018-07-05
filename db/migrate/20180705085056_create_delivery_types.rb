class CreateDeliveryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_types do |t|
      t.string :delivery_via
      t.belongs_to :cart, foreign_key: true, index: true

      t.timestamps
    end
  end
end
