module Spree
	module Api
		class ProductNutritionsController < BaseApiController

			def create
				authorize! :create, Dish::ProductNutrition
				
				@product = Spree::Product.friendly.find(params["product_id"])
				if @product

					@nutrition = Dish::Nutrition.find(nutrition_params[:id])
					if @nutrition
						@product.nutritions << @nutrition
						@product.save
						@productnutrition = Dish::ProductNutrition.where(product_id: @product.id, nutrition_id: @nutrition.id).last
						# p @productnutrition
						@productnutrition.quantity = nutrition_params[:quantity]
						@productnutrition.unit = nutrition_params[:unit]
						@productnutrition.save
						@status = [ { "messages" => "Add Nutrition to Product Successful"}]
						render "spree/api/logger/log", status: 200
					else
						invalid_resource!(@nutrition)
					end
				end
			end

			private

			def nutrition_params
				params.require(:nutrition).permit(:id, :quantity, :unit)
			end
		end 
	end
end