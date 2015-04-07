module Spree
	module Api
		class ProductIngredientsController < BaseApiController

			def index
				@ingredients = product.ingredients
				render "spree/api/ingredients/index"
			end

			def create
				authorize! :create, Dish::ProductIngredient
				
				@product = Spree::Product.friendly.find(params[:product_id])
				if @product

					@ingredient = Dish::Ingredient.find(ingredient_params[:id])
					if @ingredient
						@product.ingredients << @ingredient
						@product.save
						@status = [ { "messages" => "Add Ingredient to Product Successful"}]
						render "spree/api/logger/log", status: 200
					else
						invalid_resource!(@ingredient)
					end
				end
			end

			private

			def ingredient_params
				params.require(:ingredient).permit(:id)
			end

			def product_id
				params[:product_id]
			end

			def product
				Spree::Product.find(product_id)
			end
		end 
	end
end