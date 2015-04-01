Spree::Api::ApiHelpers.class_eval do 

	def product_attributes
		[	:name, :story, :dish_type_id, :dish_price, :dish_currency, 
      :time_cook, :difficulty_id, :bm_expert_id, :recipe_link,
      :shipping_category_id,:tax_category_id,
      :taxon_ids ]
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
