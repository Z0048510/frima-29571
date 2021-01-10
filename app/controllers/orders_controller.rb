class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :product_find_initialize
  before_action :user_check
  before_action :purchase_check

  def index
    # @product = Product.find(params[:item_id])
    @purchase_shopping = PurchaseShopping.new
  end

  def create
    # @product = Product.find(params[:item_id])
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

  def user_check
    if current_user.id == @product.user.id
      redirect_to root_path
    end
  end

  def product_find_initialize
    # @product = Product.find(params[:id])
    @product = Product.includes(:purchase).find(params[:item_id])
  end

  def purchase_check
    if @product.purchase.present?
      redirect_to root_path
    end
  end

end
