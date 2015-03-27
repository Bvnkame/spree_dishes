module Spree
	module Api
		class HowtocooksController < BaseApiController

			def create
				authorize! :create, Dish::Howtocook
				p Spree::PermittedAttributes::ATTRIBUTES
				if find_product(howtocook_params[:product_id])
					Dish::Howtocook.create(howtocook_params)
					@status = [ { "messages" => "Add How to cook Successful"}]
					render "spree/api/logger/log", status: 200
				end
			end

			private

			def howtocook_params
				params.require(:howtocook).permit(permitted_howtocook_attributes)
			end
			def permitted_howtocook_attributes
				[:product_id, :position, :title, :content]
			end
		end 
	end
end