Spree::Api::ApiHelpers.class_eval do 

	def product_attributes
		[	:id, :name, :dish_type_id, :date_delivery, :description,:cost_price, :currency, :story, :cooking_time, :expert_mind, :display_price, :available_on,
			:slug, :meta_description, :meta_keywords, :shipping_category_id,
			:taxon_ids, :total_on_hand]
	end

	def howtocook_attributes
		[:position, :title, :content, :image_url]
	end
	
	def ingredient_attributes
		[:name, :image_url]
	end

	def expert_opinion_attributes
		[:name, :image_url, :prefix, :post]
	end

end
