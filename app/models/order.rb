class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :courier, class_name: 'User'

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  enum status: [:created, :delivery, :delivered]

  def courier_checkpoints
    products.map { |product| product.shipping_address }
  end

  def localized_status
    locales = {
      created: 'Создан',
      delivery: 'В доставке',
      delivered: 'Доставлен'
    }.with_indifferent_access

    locales[status]
  end
end
