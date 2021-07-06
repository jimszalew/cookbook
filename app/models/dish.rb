class Dish < ApplicationRecord
  belongs_to :search
  attr_reader :id, :title, :ingredients, :instructions
end
