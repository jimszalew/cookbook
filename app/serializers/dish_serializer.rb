class DishSerializer < ActiveModel::Serializer
    attributes :id, :title, :ingredients, :instructions
    belongs_to :search
  end