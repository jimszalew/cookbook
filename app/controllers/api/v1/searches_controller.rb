class Api::V1::SearchesController < ApplicationController
    def index
        searches = Search.all
        # byebug

        render json: searches, status: 200
    end
end
