class OrdersController < ApplicationController
  before_action :stop_if_logged_out

  def index
    @orders = current_user.orders
  end
end
