module Dish
	class DateDelivery < ActiveRecord::Base
		def self.find_id(product_id, delivery_date)
			Dish::DateDelivery.where(:product_id => product_id, :delivery_date => delivery_date).first.id
		end
	end
end