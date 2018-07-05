class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  has_one :shipping_address, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_one :payment_type, dependent: :destroy
  has_one :delivery_type, dependent: :destroy

  enum status: %i[active purchased]

  def total_quantity
    line_items.sum(&:quantity)
  end

  def total_price
    line_items.sum { |l| l.quantity * l.product.price }
  end
end
