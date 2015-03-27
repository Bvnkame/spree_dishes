module Spree
	module Api
		class IngredientsController < BaseApiController

			def index
				@ingredients = Dish::Ingredient.all
				respond_with(@ingredients, :status => 200)
			end

			def create
				authorize! :create, Dish::Ingredient
				Dish::Ingredient.create(ingredient_params)
				@status = [ { "messages" => "Add Ingredient Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def ingredient_params
				params.require(:ingredient).permit(:name)
			end
		end 
	end
end