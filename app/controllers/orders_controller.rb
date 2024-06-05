class OrdersController < ApplicationController
  before_action :stop_if_logged_out

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.preload(:products).find(params[:id])
  end

  def create
    @order = Order.create!(delivery_address: params[:delivery_address], status: 0, customer: current_user)

    params[:products].split.map(&:to_i).each do |product_id|
      OrderProduct.create!(order: @order, product_id: product_id)
    end

    Rails.cache.delete("cart_#{current_user.id}")

    flash[:notice] = "Заказ создан. Корзина очищена"

    redirect_to order_path(@order)
  end

  def calculate_route
    order = Order.find(route_params[:id])
    route_finder = RouteFinder.new(order: order, start_address: route_params[:start_address])

    @duration = route_finder.calculate_duration

    route_finder.show_result_route(@duration)
  end

  private

  def order_params
    params.permit(delivery_address)
  end

  def route_params
    params.permit(:id, :start_address)
  end
end
