require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:courier) }

  it { should have_many(:order_products).dependent(:destroy) }
  it { should have_many(:products) }
end