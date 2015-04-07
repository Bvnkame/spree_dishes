module Spree
	module Api
		class DifficultiesController < BaseApiController
			def index
				@difficulties = Dish::Difficulty.all.ransack(params[:q]).result
				render "spree/api/difficulties/index"
			end

			def create
				authorize! :create, Dish::Difficulty
				Dish::Difficulty.create(difficulty_params)
				@status = [ { "messages" => "Add Difficulty Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def difficulty_params
				params.require(:difficulty).permit(:name)
			end
		end 
	end
end