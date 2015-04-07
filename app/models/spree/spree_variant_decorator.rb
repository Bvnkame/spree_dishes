module Spree
	Variant.class_eval do 

    def in_stock?
      # Rails.cache.fetch(in_stock_cache_key) do
      #   total_on_hand > 0
      # end
    end
    
	end
end