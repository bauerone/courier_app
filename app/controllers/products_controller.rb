class ProductsController < ApplicationController
  before_action :stop_if_logged_out

  def index

    if params[:search].present?
      key = "%#{params[:search]}%"
      @products = Product.where("name LIKE ?", key)
    else
      @products = Product.all
    end
  end
end
