object @ingredient
attributes :id, :name
node (:tam1) { |p| p.images.first }
child(:images) {
	attributes :viewable_id
	extends "spree/api/ingredient_images/show"
}