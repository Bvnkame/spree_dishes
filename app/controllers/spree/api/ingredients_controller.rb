module Spree
	module Api
		class IngredientsController < BaseApiController

			def index
				if params[:ids]
					@ingredients = Dish::Ingredient.accessible_by(current_ability, :read).where(id: params[:ids].split(','))
				elsif params[:q]
					@ingredients = Dish::Ingredient.where("lower(name) like ?", "%#{params[:q].downcase}%")
				else 
					@ingredients = Dish::Ingredient.all
				end
				render "spree/api/ingredients/index", status: 200
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