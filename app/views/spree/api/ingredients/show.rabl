object @ingredient
attributes :id, :name

child(:images => :images) do
	extends "spree/api/ingredient_images/show"
end