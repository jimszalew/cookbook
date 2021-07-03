require 'rails_helper'

RSpec.describe 'Api::V1::Searches', type: :request do
  describe 'GET /index' do
    it 'returns all searches' do
      search_1 = create(:search, criteria: 'Fruit Tart')
      search_2 = create(:search, criteria: 'Tiramisu')
      search_3 = create(:search, criteria: 'Spaghetti Bolognese')

      get '/api/v1/searches'
      results = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(results[0]['criteria']).to eq(search_1.criteria) 
      expect(results[0]['url']).to eq(search_1.url)
      expect(results[1]['criteria']).to eq(search_2.criteria) 
      expect(results[1]['url']).to eq(search_2.url) 
      expect(results[2]['criteria']).to eq(search_3.criteria) 
      expect(results[2]['url']).to eq(search_3.url)  
    end
  end

  describe 'POST /create' do
    it 'creates a new search' do
      req = { dish: { criteria: 'Gnocchi', url: 'https://api.spoonacular.com/recipes/complexSearch?query=Gnocchi'}}
      
      expect(Search.count).to eq(0)
      post '/api/v1/searches', params: req
      expect(Search.count).to eq(1)
    end
  end
end
