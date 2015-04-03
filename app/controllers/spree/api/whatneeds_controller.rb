module Spree
	module Api
		class WhatneedsController < BaseApiController

			def index
				@whatneeds = Dish::Whatneed.all.ransack(params[:q]).result
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