class Api::V1::SearchesController < ApplicationController
  def index
    searches = Search.all

    render json: searches, status: 200
  end

  def create
    search = Search.create!(criteria: dish_params[:criteria])
    query = Faraday.new(search.url)
    response = query.get
    results = JSON.parse(response.body)

    results['results'].each do |result|
      byebug
      search.dishes.create!(result)
    end

    render json: search, status: 200
  end

  private

    def dish_params
      params.require(:dish).permit(:criteria)
    end
end
