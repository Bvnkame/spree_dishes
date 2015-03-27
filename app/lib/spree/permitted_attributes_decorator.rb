module Spree
  module PermittedAttributes

    @@product_attributes = [
      :name, :story, :dish_type_id, :date_delivery, :cost_price, :currency, 
      :cooking_time, :difficulty, :expert_opinion, :whatwesends, :whatneeds, :howtocooks, :product_nutritions, :available_on, :permalink, :meta_description,
      :meta_keywords, :price, :sku, :deleted_at, :prototype_id,
      :option_values_hash, :weight, :height, :width, :depth,
      :shipping_category_id, :tax_category_id,
      :taxon_ids, :option_type_ids, :cost_currency, :cost_price]
     
    end
  end