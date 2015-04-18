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
			Spree::Product.select("spree_products.*, date_deliveries.delivery_date")
     .joins(:date_deliveries).where(:date_deliveries => {:delivery_date => date }).uniq
     
		end


  end