class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  # validations
  validates :name, presence: true, length: { minimum: 5, maximum: 20 }
  validates :quantity, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, file_size: { less_than: 1.megabytes }

  # associations
  has_and_belongs_to_many :categories
  has_many :line_items, dependent: :destroy
end
