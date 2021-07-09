class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :not_found
	rescue_from ActionController::ParameterMissing, with: :raise_422

	def not_found(exception)
		render json: { error: exception.message }, status: :not_found
	end

	def raise_422(exception)
		render json: { error: "param is missing or the value is empty: search" }, status: :unprocessable_entity
	end
end
