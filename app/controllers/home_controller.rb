class HomeController < ApplicationController
  before_action :set_featured_products

  def index; end

  private

  def set_featured_products
    @products = Product.all.sample(20)
  end
end
