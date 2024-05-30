class OrdersController < ApplicationController
  before_action :stop_if_logged_out

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.preload(:products).find(params[:id])
  end

  def calculate_route
    order = Order.find(params[:id])

    @duration = order.calculate_route
  end
end
