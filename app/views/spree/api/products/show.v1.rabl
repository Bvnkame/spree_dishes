object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes *product_attributes

node(:display_price) { |p| p.display_price.to_s }
node(:has_variants) { |p| p.has_variants? }
node(:taxon_ids) { |p| p.taxon_ids }
node(:difficulty) { |p| p.difficulty.name if p.difficulty}
node(:expert_opinion) { |p| p.expert_opinion if p.expert_opinion }

child(:images => :images) { extends "spree/api/images/show" }

child :ingredients => :whatwesends do
	attributes *ingredient_attributes
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


child :master => :master do
  extends "spree/api/variants/small"
end


child :option_types => :option_types do
  attributes *option_type_attributes
end

child :product_properties => :product_properties do
  attributes *product_property_attributes
end

child :classifications => :classifications do
  attributes :taxon_id, :position

  child(:taxon) do
    extends "spree/api/taxons/show"
  end
end
