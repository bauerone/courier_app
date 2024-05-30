require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to(:storage) }

  it { should have_many(:order_products).dependent(:destroy) }
  it { should have_many(:orders).through(:order_products) }

  it { should have_one_attached(:image) }
end