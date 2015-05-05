object false
node(:count) { @ingredients.count }
child(@ingredients => :ingredients) do
  attributes :id, :name
  node (:tam1) { |p| p.images.first }
  child(@images => :images) do 
  	node(:tam) { |p| p }
  	extends "spree/api/ingredient_images/show" 
  end
end

