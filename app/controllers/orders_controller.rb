class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:item_id])
  end

  def new

  end
  
  def create
    binding.pry
  end

end
