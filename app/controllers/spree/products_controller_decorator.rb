Spree::Api::ProductsController.class_eval do
	before_action :authenticate_user, :except => [:index, :show]

	def index
		if params[:ids]
			@products = product_scope.where(id: params[:ids].split(",").flatten)
		else
			@products = product_scope.ransack(params[:q]).result
		end

		if params[:date_delivery]
			@products = @products.where(date_delivery: params[:date_delivery])
		end 
		@products = @products.distinct.page(params[:page]).per(params[:per_page])
		expires_in 15.minutes, :public => true
		headers['Surrogate-Control'] = "max-age=#{15.minutes}"
		respond_with(@products)
	end

end