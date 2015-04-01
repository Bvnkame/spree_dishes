Spree::Api::ProductsController.class_eval do
	before_action :authenticate_user, :except => [:index, :show]

	def index
    @products = Spree::Product.all
		if params[:date_delivery]
			@products = @products.where(date_delivery: params[:date_delivery])
    end
    render "spree/api/products/index", status: 200
	end

   def show
          @product = find_product(params[:id])
          expires_in 15.minutes, :public => true
          headers['Surrogate-Control'] = "max-age=#{15.minutes}"
          headers['Surrogate-Key'] = "product_id=1"
           render "spree/api/products/show", status: 200
        end

	def create
        authorize! :create, Spree::Product
        params[:product][:available_on] ||= Time.now
        set_up_shipping_category
        p "vao create product"
        p option_types_params
        p product_params
        # options = { options_attrs: option_types_params }
        # p options
        # @product = Core::Importer::Product.new(nil, product_params, options).create
        @product = Spree::Product.new(product_params)
        # p "product"
        # p Spree::PermittedAttributes.product_attributes
        # p @product
        @product.save
        # p "save ok"
        if @product.persisted?
          respond_with(@product, :status => 201, :default_template => :show)
        else
          invalid_resource!(@product)
        end
      end

       def update
        @product = find_product(params[:id])
        authorize! :update, @product

    
        @product = @product.update(product_params)

        if @product.errors.empty?
          respond_with(@product.reload, :status => 200, :default_template => :show)
        else
          invalid_resource!(@product)
        end
      end

end