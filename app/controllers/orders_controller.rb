class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:item_id])
    @purchase_shopping = PurchaseShopping.new
  end

  def create
    @product = Product.find(params[:item_id])
    @purchase_shopping = PurchaseShopping.new(purchase_shopping_params)
    if @purchase_shopping.valid?
      pay_item
      @purchase_shopping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shopping_params
    params.require(:purchase_shopping).permit(:postnumber, :area_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.amount,
      card: purchase_shopping_params[:token],
      currency: 'jpy'
    )
  end

end
