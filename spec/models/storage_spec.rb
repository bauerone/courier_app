require 'rails_helper'

RSpec.describe Storage, type: :model do
  it { should have_many(:products) }
end
