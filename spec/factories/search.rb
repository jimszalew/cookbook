require 'rails_helper'

FactoryBot.define do
  factory :search do
    criteria { Faker::Food.dish }
    url { "https://api.spoonacular.com/recipes/complexSearch?query=#{criteria}" }
  end
end