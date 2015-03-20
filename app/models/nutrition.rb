class Nutrition < ActiveRecord::Base
	self.table_name = "nutritions"
	has_many :products, through: :product_nutritions, :class_name => "Spree::Product"
	has_many :product_nutritions, :class_name => "ProductNutrition", foreign_key: 'nutrition_id'
end
