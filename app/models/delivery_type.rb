class DeliveryType < ApplicationRecord
  belongs_to :cart

  DELIVERY_TYPES = ['Courier(DPD)', 'Personal collection', 'InPost']
end
