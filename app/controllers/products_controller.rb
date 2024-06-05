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

  def add_to_cart
    products_in_cart = Rails.cache.read("cart_#{current_user.id}") || []
    products_in_cart.append(params[:product_id])

    Rails.cache.write("cart_#{current_user.id}", products_in_cart, expires_in: 24.hours)

    flash[:notice] = "Товар добавлен в корзину"
    redirect_to products_path
  end

  def clean_cart
    Rails.cache.delete("cart_#{current_user.id}")

    redirect_to cart_path
  end

  def cart
    products_in_cart = Rails.cache.read("cart_#{current_user.id}") || []

    @products = Product.where(id: products_in_cart)
  end
end
