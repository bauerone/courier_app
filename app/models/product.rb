class Product < ApplicationRecord
  belongs_to :storage

  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  has_one_attached :image
end
