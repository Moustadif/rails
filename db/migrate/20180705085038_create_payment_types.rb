class CreatePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_types do |t|
      t.string :payment_via
      t.belongs_to :cart, foreign_key: true, index: true

      t.timestamps
    end
  end
end
