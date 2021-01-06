class ItemsController < ApplicationController
  def index
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

  private

  def product_params
    params.require(:product).permit(:image, :productname, :amount, :description, :category_id, :status_id, :payment_id,
                                    :area_id, :day_id).merge(user_id: current_user.id)
  end
end
