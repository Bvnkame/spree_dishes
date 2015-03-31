module Spree
	module Api
		class DateDeliveriesController < BaseApiController
			def index
				@date_deliveries = Dish::DateDelivery.all
				render "spree/api/date_deliveries/index"
			end

			def create
				authorize! :create, Dish::DateDelivery
				if date_deliveries_params[:product_ids] &&
					date_deliveries_params[:product_ids].split(",").flatten.each do |product_id|
						@product = Spree::Product.find(product_id.to_i)
						if @product
							@date_delivery = Dish::DateDelivery.new(product_id: @product.id, delivery_date: date_deliveries_params["delivery_date"])
							@date_delivery.save
						else
							invalid_resource!(@product)
						end
					end
				end
				@status = [ { "messages" => "Add Date Deliveries Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def date_deliveries_params
				params.require(:date_delivery).permit(permitted_date_delivery_attributes)
			end

			def permitted_date_delivery_attributes
				[:product_ids, :delivery_date ]
			end
		end 
	end
end