object false
node(:count) { @ingredients.count }
child(@ingredients => :ingredients) do
  attributes :id, :name
  child(@images => :images) { extends "spree/api/ingredient_images/show" }
end

