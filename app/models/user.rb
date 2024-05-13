class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: [:customer, :courier, :admin]

  has_many :orders_to_recieve, class_name: 'Order', foreign_key: 'customer_id'
  has_many :orders_to_deliver, class_name: 'Order', foreign_key: 'courier_id'

  def orders
    case role
    when :customer.to_s
      orders_to_recieve
    when :courier.to_s
      orders_to_deliver
    else
      nil
    end
  end

  def self.localized_roles
    {
      customer: 'Покупатель',
      courier: 'Курьер',
      admin: 'Администратор'
    }
  end
end
