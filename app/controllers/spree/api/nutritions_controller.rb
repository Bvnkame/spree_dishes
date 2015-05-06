module Spree
	module Api
		class NutritionsController < BaseApiController
			def index
				if params[:ids]
					@nutritions = Dish::Nutrition.accessible_by(current_ability, :read).where(id: params[:ids].split(','))
				elsif params[:q]
					@nutritions = Dish::Nutrition.where("lower(name) like ?", "%#{params[:q].downcase}%")
				else
					@nutritions = Dish::Nutrition.all
				end
				
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