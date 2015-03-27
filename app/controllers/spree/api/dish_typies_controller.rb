module Spree
	module Api
		class DishTypiesController < BaseApiController

			def index
				@dish_typies = Dish::DishType.all
				respond_with(@dish_typies, :status => 200)
			end

			def create
				authorize! :create, Dish::DishType
				Dish::DishType.create(dish_type_params)
				@status = [ { "messages" => "Add Dish Type Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def dish_type_params
				params.require(:dish_type).permit(:name)
			end
		end 
	end
end