module Spree
	module Api
		class ProductWhatneedsController < BaseApiController

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
		end 
	end
end