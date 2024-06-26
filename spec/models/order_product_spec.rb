require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:product) }
end