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

    results.each do
      search.dishes.create!
    end

    render json: search, status: 200
  end

  private

    def dish_params
      params.require(:dish).permit(:criteria)
    end
end
