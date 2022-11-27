class Dish < ApplicationRecord
  belongs_to :search
  attr_reader :title, :ingredients, :instructions
end
