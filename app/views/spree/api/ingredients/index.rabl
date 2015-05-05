object false
node(:count) { @ingredients.count }
child(@ingredients => :ingredients) do
  attributes :id, :name
  child(@images => :images) do 
  	node(:tam) { |p| p }
  	extends "spree/api/ingredient_images/show" 
  end
end

