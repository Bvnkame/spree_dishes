module Spree
	module Api
		class ProductWhatneedsController < BaseApiController

			def index
				@whatneeds = product.whatneeds
				render "spree/api/whatneeds/index"
			end

			def create
				authorize! :create, Dish::ProductWhatneed
				
				@product = Spree::Product.friendly.find(params["product_id"])
				if @product

					@whatneed = Dish::Whatneed.find(whatneed_params[:id])
					if @whatneed
						@product.whatneeds << @whatneed
						@product.save
						@status = [ { "messages" => "Add What you need to Product Successful"}]
						render "spree/api/logger/log", status: 200
					else
						invalid_resource!(@whatneed)
					end
				end
			end

			private

			def whatneed_params
				params.require(:whatneed).permit(:id)
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