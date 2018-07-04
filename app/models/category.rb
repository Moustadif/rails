class Category < ApplicationRecord

  # validations
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
  validates :description, presence: true

  # associations
  has_and_belongs_to_many :products
end
