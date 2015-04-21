object @product_date
attributes :delivery_date

node { |p|
	child( Spree::Product.product_of_date(p.delivery_date) => :products) do
		node(:pd_id) { |pro|
			Dish::DateDelivery.find_id(pro.id, p.delivery_date)
		}
		extends "spree/api/products/small_show"
	end
}
