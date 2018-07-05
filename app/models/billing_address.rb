class BillingAddress < ApplicationRecord
  belongs_to :cart
  validates :street, :city, :state, :zip, presence: true
end
