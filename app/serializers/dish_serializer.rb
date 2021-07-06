class DishSerializer < ActiveModel::Serializer
    attributes :id, :title, :extendedIngredients, :analyzedInstructions
    belongs_to :search
  end