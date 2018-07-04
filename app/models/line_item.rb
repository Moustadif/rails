class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def quantity_available
    quantity < product.quantity
  end
end
