class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # associations
  has_many :carts, dependent: :destroy
  has_one :current_cart, -> { where(status: Cart.statuses[:active])}, class_name: 'Cart'
end
