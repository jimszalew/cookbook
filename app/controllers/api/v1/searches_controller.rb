class Api::V1::SearchesController < ApplicationController
  def index
    searches = Search.all

    render json: searches, status: 200
  end

  def create
    search = Search.create!(criteria: dish_params[:criteria], url: dish_params[:url])

    render json: search, status: 200
  end

  private

    def dish_params
      params.require(:dish).permit(:criteria, :url)
    end
end
