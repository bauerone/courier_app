class OrdersController < ApplicationController
  before_action :stop_if_logged_out

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.preload(:products).find(params[:id])
  end

  def calculate_route
    order = Order.find(route_params[:id])

    @duration = RouteFinder.new(order: order, start_address: route_params[:start_address]).find_optimal_route
  end

  private

  def route_params
    params.permit(:id, :start_address)
  end
end
