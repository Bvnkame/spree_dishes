class Ingredient < Spree::Base
	self.table_name = "ingredients"
	has_many :products, through: :product_ingredients, :class_name => "Spree::Product"
	has_many :product_ingredients, :class_name => "ProductIngredient", foreign_key: 'ingredient_id'
end

