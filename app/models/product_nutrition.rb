class ProductNutrition < Spree::Base
	self.table_name = "spree_products_nutritions"
	belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
	belongs_to :nutrition, :class_name => "Nutrition", foreign_key: "nutrition_id"
end
