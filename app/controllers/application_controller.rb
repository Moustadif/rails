class ApplicationController < ActionController::Base

  before_action :set_categories, :set_featured_products, :set_cart


  def set_categories
    @categories = Category.all
  end

  def set_featured_products
    @products = Product.all.sample(20)
  end

  def set_cart
    if user_signed_in?
      if  current_user.cart.present?
        @current_cart = current_user.cart
      else
        @current_cart = Cart.create(user_id: current_user.id)
      end
    else
      @current_cart = nil
    end
  end
end
