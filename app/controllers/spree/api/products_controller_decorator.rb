Spree::Api::ProductsController.class_eval do
	before_action :authenticate_user, :except => [:index, :show, :duration]

	def index
    @products = Spree::Product.all.ransack(params[:q]).result
    if params[:delivery_date]
     @products = Spree::Product.product_of_date(params[:delivery_date]).ransack(params[:q]).result
    end
    render "spree/api/products/index", status: 200
  end

  def show
    @product = Spree::Product.find(params[:id])
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
            @status = [ { "messages" => "Add Product Successful"}]
            render "spree/api/logger/log"
          else
            invalid_resource!(@product)
          end
        end

  def update
    @product = find_product(params[:id])
    authorize! :update, @product

    
    @product.update(product_params)

    if @product.update(product_params)
      @status = [ { "messages" => "Update Product Successful"}]
      render "spree/api/logger/log", status: 201
    else
      invalid_resource!(@product)
    end
  end

  def duration
    if params[:start_date] && params[:end_date]
      @product_date = Dish::DateDelivery.where(:delivery_date => params[:start_date]..params[:end_date]).select(:delivery_date).uniq.order(:delivery_date)

      render "spree/api/products/products_duration"
    else
      @status = [ { "messages" => "Missing Params start_date or end_date"}]
      render "spree/api/logger/log", status: 400
    end
  end

  def remove_delivery_date
    @product = Spree::Product.find(params[:product_id])
    authorize! :update, @product
    if params[:delivery_date]
      Dish::DateDelivery.delete_all(:product_id => params[:product_id], :delivery_date => params[:delivery_date])
      @status = [ { "messages" => "Remove Successful"}]
      render "spree/api/logger/log", status: 200
    else
      @status = [ { "messages" => "Missing Params delivery_date"}]
      render "spree/api/logger/log", status: 400
    end
  end

end
