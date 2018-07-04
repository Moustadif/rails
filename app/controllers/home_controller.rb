class HomeController < ApplicationController
  def index
    @products = Product.search(params[:name])
  end
end
