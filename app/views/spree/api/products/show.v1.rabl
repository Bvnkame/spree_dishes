object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :dish_type_id, :dish_price, :dish_currency, :story, :recipe_link

child :date_deliveries => :date_deliveries do
  node(:date) { |p| p.delivery_date }
end

node(:time_cook) { |p| p.time_cook }
node(:dish_type){ |p| p.dish_type.name if p.dish_type }
node(:difficulty) { |p| p.difficulty.name if p.difficulty}

child(:variant_images => :images) { extends "spree/api/images/show" }

child :ingredients => :whatwesends do
	extends "spree/api/ingredients/show"
end

child :whatneeds => :whatneeds do
	attributes :name
end

child :howtocooks => :howtocooks do
	attributes *howtocook_attributes
end

child :product_nutritions => :product_nutritions do
	attributes :unit, :quantity
	node(:nutrition) { |p| p.nutrition.name}
end

child :expert => :expert do
  extends "bm/expert/show"
end
