class ApplicationController < ActionController::Base
  before_action :set_categories, :set_cart

  def set_categories
    @categories = Category.all
  end

  def set_cart
    if user_signed_in?
      if  current_user.current_cart.present?
        @current_cart = current_user.current_cart
      else
        @current_cart = Cart.create!(user_id: current_user.id, status: Cart.statuses[:active])
      end
    else
      @current_cart = nil
    end
  end
end
