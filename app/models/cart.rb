class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def total_quantity
    line_items.sum(&:quantity)
  end

  def total_price
    line_items.sum { |l| l.quantity * l.product.price }
  end
end
