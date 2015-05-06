module Dish
	class Whatneed < Spree::Base
		self.table_name = "whatneeds"
		has_many :products, through: :product_whatneeds, :class_name => "Spree::Product"
		has_many :product_whatneeds, :class_name => "Dish::ProductWhatneed", foreign_key: 'whatneed_id'
	end
end