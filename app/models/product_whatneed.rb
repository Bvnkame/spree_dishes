class ProductWhatneed < Spree::Base
	self.table_name = "spree_products_whatneeds"
	belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
	belongs_to :whatneed, :class_name => "Whatneed", foreign_key: "whatneed_id"
end
