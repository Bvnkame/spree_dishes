module Spree
  module PermittedAttributes

    @@product_attributes = [
      :name, :story, :dish_type_id, :dish_price, :dish_currency, 
      :time_cook, :difficulty_id, :bm_expert_id, :recipe_link,
      :shipping_category_id,:tax_category_id,
      :taxon_ids ]
     
    end
  end