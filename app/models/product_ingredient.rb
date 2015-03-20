class ProductIngredient < Spree::Base
	self.table_name = "spree_products_ingredients"
	belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
	belongs_to :ingredient, :class_name => "Ingredient", foreign_key: "ingredient_id"
end
