class OrdersController < ApplicationController
  def index
    @order = Order.all
  end

  def create
    @order = Order.new(order_params)
  end

  def new
    @order = Order.new
  end

  private

  def order_params
    params.require(:order).permit(:id, :total)
  end
end
