class HomeController < ApplicationController
  def index
    @customers_count = User.customer.count
    @couriers_count = User.courier.count
    @products_count = Product.count
    @orders_count = Order.count
  end
end
