class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product_find_initialize, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :update, :destroy]

  def index
    # @products = Product.all.order('created_at DESC')
    @products = Product.includes(:purchase).order('created_at DESC')
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
    @message = Message.new
    @messages = Message.includes(:user).where(product_id = params[:id]).order('created_at DESC')
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to item_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :productname, :amount, :description, :category_id, :status_id, :payment_id,
                                    :area_id, :day_id).merge(user_id: current_user.id)
  end

  def product_find_initialize
    # @product = Product.find(params[:id])
    @product = Product.includes(:purchase).find(params[:id])
  end

  def user_check
    if current_user.id != @product.user.id
      redirect_to root_path
    end
  end

end
