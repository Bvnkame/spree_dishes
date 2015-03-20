class Whatneed < ActiveRecord::Base
	self.table_name = "whatneeds"
	has_many :products, through: :product_whatneeds, :class_name => "Spree::Product"
	has_many :product_whatneeds, :class_name => "ProductWhatneed", foreign_key: 'whatneed_id'
end
