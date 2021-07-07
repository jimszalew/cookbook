require 'rails_helper'

RSpec.describe 'Api::V1::Searches', type: :request do
  describe 'GET #index' do
    before(:each) do
      @search_1 = create(:search, criteria: 'Fruit Tart')
      @search_2 = create(:search, criteria: 'Spaghetti Bolognese')
      @search_3 = create(:search, criteria: 'Apple Pie')
    end
    
    it 'returns all searches sorted by updated_at by default' do
      get '/api/v1/searches'
      results = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(results[0]['criteria']).to eq(@search_1.criteria) 
      expect(results[0]['url']).to eq(@search_1.url)
      expect(results[1]['criteria']).to eq(@search_2.criteria) 
      expect(results[1]['url']).to eq(@search_2.url) 
      expect(results[2]['criteria']).to eq(@search_3.criteria) 
      expect(results[2]['url']).to eq(@search_3.url)  
    end

    it 'can sort searches alphabetically by criteria' do
      get '/api/v1/searches?crit_asc=true'
      results = JSON.parse(response.body)
      sorted_crits = results.pluck('criteria')
      expected_crits = [@search_3.criteria, @search_1.criteria, @search_2.criteria]

      expect(response.status).to eq(200)
      expect(sorted_crits).to eq(expected_crits)
    end

    it 'can sort searches in descending order of updated_at' do
      get '/api/v1/searches?updated_desc=true'
      results = JSON.parse(response.body)
      expected = results.pluck('id')
      sorted = [@search_3.id, @search_2.id, @search_1.id]
# byebug
      expect(response.status).to eq(200)
      expect(sorted).to eq(expected)
    end
  end

  describe 'GET #show' do
    it 'returns search by id with its related dishes' do
      search_4 = create(:search, criteria: 'Soup')
      dish_1 = search_4.dishes.create(title: 'Turtle Soup', ingredients: {}, instructions: {})
      dish_2 = search_4.dishes.create(title: 'Tomato Soup', ingredients: {}, instructions: {})
      dish_3 = search_4.dishes.create(title: 'Minestrone', ingredients: {}, instructions: {})

      get "/api/v1/searches/#{search_4.id}"
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(search_4.id).to eq(result['id'])
      expect(search_4.criteria).to eq(result['criteria'])
      expect(search_4.url).to eq(result['url'])
      expect(search_4.dishes.count).to eq(3)
    end
  end

  describe 'POST #create' do
    it 'creates a new search and dishes' do
      req = { dish: { criteria: 'Gnocchi'} }
      
      expect(Search.count).to eq(0)
      
      post '/api/v1/searches', params: req
      result = JSON.parse(response.body)
      
      expect(Search.count).to eq(1)
      expect(Dish.count).to eq(10)

      expect(response.status).to eq(200)
      expect(result['criteria']).to eq('Gnocchi')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes search by id and its related dishes' do
      search_5 = create(:search, criteria: 'Pasta')
      dish_4 = search_5.dishes.create(title: 'Fettucini Alfredo', ingredients: {}, instructions: {})
      dish_5 = search_5.dishes.create(title: 'Pasta Primavera', ingredients: {}, instructions: {})
      dish_6 = search_5.dishes.create(title: 'Pappardelle Carbonara', ingredients: {}, instructions: {})
      search_6 = create(:search, criteria: 'Pancakes')
      dish_7 = search_6.dishes.create(title: 'Gluten Free Banana Oatmeal Pancakes', ingredients: {}, instructions: {})
      dish_8 = search_6.dishes.create(title: 'Lemon Ricotta Poppyseed Pancakes', ingredients: {}, instructions: {})
      dish_9 = search_6.dishes.create(title: 'Bacon Pancakes', ingredients: {}, instructions: {})

      expect(Search.count).to eq(2)
      expect(Dish.count).to eq(6)

      delete "/api/v1/searches/#{search_5.id}"

      expect(response.status).to eq(200)
      expect(response.body).to eq('Pasta search object and its related dishes have been deleted')
      expect(Search.count).to eq(1)
      expect(Dish.count).to eq(3)
    end
  end
end