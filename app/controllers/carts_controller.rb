class CartsController < ApplicationController
  before_action :authenticate_user!, :set_cart, only: [:show, :review, :confirmation, :place_order]
  before_action :reset_cart, only: :confirmation

  # GET /carts/1
  # GET /carts/1.json
  def show; end

  def review; end

  def place_order
    @current_cart.status = Cart.statuses[:confirmed]
    @current_cart.save
    respond_to do |format|
      format.html { redirect_to confirmation_carts_path(id: @current_cart), notice: 'Order successfully placed.' }
      format.json { head :no_content }
    end
  end

  def confirmation; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @current_cart = Cart.find(params[:id])
    end

    def reset_cart
      @last_cart = current_user.carts.where(status: Cart.statuses[:confirmed]).order(updated_at: :desc).first
      @current_cart = Cart.create!(user_id: current_user.id, status: Cart.statuses[:active])
    end
end
