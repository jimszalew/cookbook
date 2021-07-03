class Search < ApplicationRecord
  validates_presence_of :criteria
  validates_uniqueness_of :criteria

  def url
    "https://api.spoonacular.com/recipes/complexSearch?apiKey=#{ENV['SPOONACULAR_API_KEY']}&query=#{self.criteria}&addRecipeInformation=true"
  end
end
