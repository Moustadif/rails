class BillingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_billing_address, only: [:show, :edit, :update, :destroy]

  # GET /billing_addresses
  # GET /billing_addresses.json
  def index
    @billing_addresses = BillingAddress.all
  end

  # GET /billing_addresses/1
  # GET /billing_addresses/1.json
  def show
  end

  # GET /billing_addresses/new
  def new
    @billing_address = BillingAddress.new
  end

  # GET /billing_addresses/1/edit
  def edit
  end

  # POST /billing_addresses
  # POST /billing_addresses.json
  def create
    @billing_address = BillingAddress.new(billing_address_params)

    respond_to do |format|
      if @billing_address.save
        if @current_cart.delivery_type.present?
          format.html { redirect_to edit_delivery_type_path notice: 'Billing address was successfully created.' }
        else
          format.html { redirect_to new_delivery_type_path, notice: 'Billing address was successfully created.' }
        end
        format.json { render :show, status: :created, location: @billing_address }
      else
        format.html { render :new }
        format.json { render json: @billing_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_addresses/1
  # PATCH/PUT /billing_addresses/1.json
  def update
    respond_to do |format|
      if @billing_address.update(billing_address_params)
        if @current_cart.delivery_type.present?
          format.html { redirect_to edit_delivery_type_path, notice: 'Billing address was successfully updated.' }
        else
          format.html { redirect_to new_delivery_type_path, notice: 'Billing address was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @billing_address }
      else
        format.html { render :edit }
        format.json { render json: @billing_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_addresses/1
  # DELETE /billing_addresses/1.json
  def destroy
    @billing_address.destroy
    respond_to do |format|
      format.html { redirect_to billing_addresses_url, notice: 'Billing address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_address
      @billing_address = BillingAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_address_params
      params.require(:billing_address).permit(:street, :city, :state, :zip, :cart_id)
    end
end
