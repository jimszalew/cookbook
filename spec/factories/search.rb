require 'rails_helper'

FactoryBot.define do
  factory :search do
    criteria { Faker::Food.dish }
  end
end