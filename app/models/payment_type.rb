class PaymentType < ApplicationRecord
  belongs_to :cart
  validates :payment_via, presence: true

  PAYMENT_TYPES  = ['Cash On Delivery', 'Bank Transfer', 'Dotpay']
end
