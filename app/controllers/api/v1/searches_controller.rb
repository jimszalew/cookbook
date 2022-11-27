class Api::V1::SearchesController < ApplicationController
  include Sorter
  
  def index
    searches = Search.all
    sorted = sorts(searches, params)

    render json: sorted, status: 200
  end

  def show
    search = Search.find(params[:id])
    render json: search, status: 200
  end

  def create
    search = Search.create!(criteria: search_params[:criteria])
    query = Faraday.new(search.url)
    
    response = query.get
    results = JSON.parse(response.body)

    results['results'].each do |r|
      search.dishes.create({title: r['title'], ingredients: r['extendedIngredients'][0], instructions: r['analyzedInstructions'][0]})
    end
    render json: search, status: 200
  end

  def destroy
    search = Search.find(params[:id])
    search.destroy

    render json: "#{search.criteria} search object and its related dishes have been deleted", status: 200
  end

  private

    def search_params
      params.require(:search).permit(:criteria)
    end
end
