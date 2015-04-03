module Dish
	class Ingredient < Spree::Base
		self.table_name = "ingredients"
		has_many :products, through: :product_ingredients, :class_name => "Spree::Product"
		has_many :product_ingredients, :class_name => "Dish::ProductIngredient", foreign_key: 'ingredient_id'
		has_many :images, as: :viewable, dependent: :destroy, class_name: "Dish::IngredientImage"
	end
end
