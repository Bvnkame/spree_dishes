Spree::Api::ProductsController.class_eval do
	before_action :authenticate_user, :except => [:index, :show]
end