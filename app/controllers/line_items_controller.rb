class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[add_quantity reduce_quantity destroy]
  before_action :authenticate_user!, :set_cart, only: %i[create add_quantity reduce_quantity destroy]

  # POST /line_items
  # POST /line_items.json
  def create
    chosen_product = Product.find(params[:product_id])
    if @current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = @current_cart.line_items.find_by(product_id: chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = @current_cart
      @line_item.product = chosen_product
    end

    @line_item.save
    respond_to do |format|
      format.html { redirect_to cart_path(@current_cart), notice: 'Item successfully added to cart!' }
      format.json { head :no_content }
    end
  end

  def add_quantity
    if @line_item.quantity_available
      @line_item.quantity += 1
      @line_item.save
      respond_to do |format|
        format.html { redirect_to cart_path(@current_cart), notice: 'Item quantity successfully increased!' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to cart_path(@current_cart), notice: 'Sorry! You have added more products than we have in stock.' }
        format.json { head :no_content }
      end
    end
  end

  def reduce_quantity
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    respond_to do |format|
      format.html { redirect_to cart_path(@current_cart), notice: 'Item quantity successfully decreased!' }
      format.json { head :no_content }
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@current_cart), notice: 'Line item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    puts "yoyo#{params}"
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id, :quantity)
  end

  def set_cart
    @current_cart = current_user.cart
  end
end
