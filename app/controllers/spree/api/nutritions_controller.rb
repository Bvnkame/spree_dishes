module Spree
	module Api
		class NutritionsController < BaseApiController
			def index
				@nutritions = Dish::Nutrition.all
				render "spree/api/nutritions/index", status: 200
			end

			def create
				authorize! :create, Dish::Nutrition
				Dish::Nutrition.create(nutrition_params)
				@status = [ { "messages" => "Add Nutrition Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def nutrition_params
				params.require(:nutrition).permit(:name)
			end
		end 
	end
end