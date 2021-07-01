class Search < ApplicationRecord
    validates_presence_of :criteria
    validates_uniqueness_of :criteria
    validates_presence_of :url
end
