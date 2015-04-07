module Dish
	class ProductNutrition < Spree::Base
		self.table_name = "spree_products_nutritions"
		belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
		belongs_to :nutrition, :class_name => "Dish::Nutrition", foreign_key: "nutrition_id"


		def nutrition_name
			nutrition.name if nutrition
		end

		def nutrition_name=(name)
			unless name.blank?
				unless nutrition = Nutrition.find_by(name: name)
					nutrition = Nutrition.create(name: name)
				end
				self.nutrition = nutrition
			end
		end

	end
end