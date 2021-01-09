class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update(product_params)
  #     redirect_to item_path(@product.id)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   product = Product.find(params[:id])
  #   product.destroy
  #   redirect_to root_path
  # end

  private

  def product_params
    params.require(:product).permit(:image, :productname, :amount, :description, :category_id, :status_id, :payment_id,
                                    :area_id, :day_id).merge(user_id: current_user.id)
  end
end
