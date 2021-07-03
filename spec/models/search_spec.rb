require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of :criteria }
  it { should validate_uniqueness_of :criteria }
end
