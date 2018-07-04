class ApplicationController < ActionController::Base

  before_action :set_categories, :set_featured_products


  def set_categories
    @categories = Category.all
  end

  def set_featured_products
    @products = Product.order("RANDOM()").limit(10)
  end
end
