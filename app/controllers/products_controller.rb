class ProductsController < ApplicationController
  before_action :stop_if_logged_out

  def index
    @products = Product.all
  end
end
