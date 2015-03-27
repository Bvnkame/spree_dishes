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
		def set_master_variant_defaults
      p "build master"
      master.is_master = true
    end

    def build_variants_from_option_values_hash
      p "build variant"
      ensure_option_types_exist_for_values_hash
      values = option_values_hash.values
      values = values.inject(values.shift) { |memo, value| memo.product(value).map(&:flatten) }

      values.each do |ids|
        variant = variants.create(
          option_value_ids: ids,
          price: master.price
        )
      end
      save
    end


    def save_master
    	p "build save master"
      if master_updated?
        master.save!
        @nested_changes = true
      end
    end

    def master_updated?
      master && (
        master.new_record? ||
        master.changed? ||
        (
          master.default_price &&
          (
            master.default_price.new_record? ||
            master.default_price.changed?
          )
        )
      )
    end


    def validate_master
    	p "validate master t"
      # We call master.default_price here to ensure price is initialized.
      # Required to avoid Variant#check_price validation failing on create.
      unless master.default_price && master.valid?
        master.errors.each do |att, error|
          self.errors.add(att, error)
        end
      end
    end


	end