class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shipping_address, only: [:show, :edit, :update, :destroy]

  # GET /shipping_addresses
  # GET /shipping_addresses.json
  def index
    @shipping_addresses = ShippingAddress.all
  end

  # GET /shipping_addresses/1
  # GET /shipping_addresses/1.json
  def show
  end

  # GET /shipping_addresses/new
  def new
    @shipping_address = ShippingAddress.new
  end

  # GET /shipping_addresses/1/edit
  def edit
  end

  # POST /shipping_addresses
  # POST /shipping_addresses.json
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)

    respond_to do |format|
      if @shipping_address.save
        if @current_cart.billing_address.present?
          format.html { redirect_to edit_billing_address_path, notice: 'Shipping address was successfully created.' }
        else
          format.html { redirect_to new_billing_address_path, notice: 'Shipping address was successfully created.' }
        end
        format.json { render :show, status: :created, location: @shipping_address }
      else
        format.html { render :new }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_addresses/1
  # PATCH/PUT /shipping_addresses/1.json
  def update
    respond_to do |format|
      if @shipping_address.update(shipping_address_params)
        if @current_cart.billing_address.present?
          format.html { redirect_to edit_billing_address_path, notice: 'Shipping address was successfully created.' }
        else
          format.html { redirect_to new_billing_address_path, notice: 'Shipping address was successfully created.' }
        end
        format.json { render :show, status: :ok, location: @shipping_address }
      else
        format.html { render :edit }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_addresses/1
  # DELETE /shipping_addresses/1.json
  def destroy
    @shipping_address.destroy
    respond_to do |format|
      format.html { redirect_to shipping_addresses_url, notice: 'Shipping address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_address
      @shipping_address = ShippingAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_address_params
      params.require(:shipping_address).permit(:street, :city, :state, :zip, :cart_id)
    end
end
