require 'rails_helper'

FactoryBot.define do
  factory :search do
    criteria { Faker::Food.dish }
    url { "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{SPOONACULAR_API_KEY}&query=#{criteria}&addRecipeInformation=true" }
  end
end