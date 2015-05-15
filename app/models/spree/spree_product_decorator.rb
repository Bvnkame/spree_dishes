Spree::Product.class_eval do 

	# Product.variants.delete
	has_many :ingredients, through: :product_ingredients, :class_name => "Dish::Ingredient"
	has_many :product_ingredients, :class_name => "Dish::ProductIngredient", foreign_key: 'product_id'
	
	belongs_to :difficulty, :class_name => "Dish::Difficulty", foreign_key: 'difficulty_id'

	has_many :whatneeds, through: :product_whatneeds, :class_name => "Dish::Whatneed"
	has_many :product_whatneeds, :class_name => "Dish::ProductWhatneed", foreign_key: 'product_id'
	
	has_many :nutritions, through: :product_nutritions, :class_name => "Dish::Nutrition"
	has_many :product_nutritions, :class_name => "Dish::ProductNutrition", foreign_key: 'product_id'

	has_many :howtocooks, :class_name => "Dish::Howtocook"

	belongs_to :expert, :class_name => "Bm::Expert", foreign_key: 'bm_expert_id'

	has_many :date_deliveries, :class_name => "Dish::DateDelivery"

	belongs_to :dish_type, :class_name => "Dish::DishType"


	accepts_nested_attributes_for :product_nutritions, allow_destroy: true, reject_if: lambda { |pp| pp[:nutrition_name].blank? }

	def self.product_of_date(date)
		Spree::Product.select("spree_products.*, date_deliveries.delivery_date").joins(:date_deliveries).where(:date_deliveries => {:delivery_date => "2015-05-11" }).uniq.order(:dish_type_id)
	end

	def copy_data_whatneed(product)
		array = Dish::ProductWhatneed.where(product_id: product.id)
			array.each do |w|
				tam = Dish::ProductWhatneed.new
				tam.product_id = self.id
				tam.whatneed_id = w.whatneed_id
				tam.save!
			end
		end
		def copy_data_nutrition(product)
			array = Dish::ProductNutrition.where(product_id: product.id)
				array.each do |w|
					tam = Dish::ProductNutrition.new
					tam.product_id = self.id
					tam.nutrition_id = w.nutrition_id
					tam.quantity = w.quantity
					tam.unit = w.unit
					tam.save!
			end
		end

		def copy_data_howtocook(product)
			product.howtocooks.each do |w|
				tam = Dish::Howtocook.new
				tam.position = w.position
				tam.title = w.title
				tam.content = w.content
				tam.product_id = self.id
				tam.save!
			end
		end
end