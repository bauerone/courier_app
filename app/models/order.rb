class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :courier, class_name: 'User'
end
