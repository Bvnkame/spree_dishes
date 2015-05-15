module Spree
	module Api
		class WhatneedsController < BaseApiController

			def index
				if params[:ids]
					@whatneeds = Dish::Whatneed.accessible_by(current_ability, :read).where(id: params[:ids].split(','))
				else
					@whatneeds = Dish::Whatneed.where("lower(name) like ?", "%#{params[:q].downcase}%")
				end
        render "spree/api/whatneeds/index"
			end

			def create
				authorize! :create, Dish::Whatneed
				Dish::Whatneed.create(whatneed_params)
				@status = [ { "messages" => "Add What You Need Successful"}]
				render "spree/api/logger/log", status: 200
			end

			private

			def whatneed_params
				params.require(:whatneed).permit(:name)
			end
		end 
	end
end