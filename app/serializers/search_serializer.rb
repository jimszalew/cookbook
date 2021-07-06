class SearchSerializer < ActiveModel::Serializer
    attributes :id, :criteria, :url
    has_many :dishes
  end