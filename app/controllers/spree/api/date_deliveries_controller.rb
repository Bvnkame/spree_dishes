module Spree
	module Api
		class DateDeliveriesController < BaseApiController
			def index
				@date_deliveries = Dish::DateDelivery.all.ransack(params[:q]).result
				render "spree/api/date_deliveries/index"
			end

			def create
				authorize! :create, Dish::DateDelivery
				if date_deliveries_params[:product_ids] &&
					date_deliveries_params[:product_ids].split(",").flatten.each do |product_id|
						@product = Spree::Product.find(product_id.to_i)
						if @product
							unless Dish::DateDelivery.exists?(:product_id => @product.id, :delivery_date => date_deliveries_params["delivery_date"])
								@date_delivery = Dish::DateDelivery.new(product_id: @product.id, delivery_date: date_deliveries_params["delivery_date"])
								@date_delivery.save
							end
						else
							invalid_resource!(@product)
						end
					end
				end
				render "spree/api/date_deliveries/show", status: 200
			end

			def update
				if params[:delivery_date]
					@date_delivery = Dish::DateDelivery.find(params[:id])
					if @date_delivery
						@date_delivery.update(:delivery_date => params[:delivery_date])
						render "spree/api/date_deliveries/show", status: 200
					else
						invalid_resource!(@date_delivery)
					end
				else
					@status = [ { "messages" => "Missing Params delivery_date"}]
					render "spree/api/logger/log", status: 400
				end
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