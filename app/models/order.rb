class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :courier, class_name: 'User'

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  enum status: [:created, :delivery, :delivered]
end
