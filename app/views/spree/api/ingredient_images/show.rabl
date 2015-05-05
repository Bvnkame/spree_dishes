object @image

Dish::IngredientImage.attachment_definitions[:attachment][:styles].each do |k,v|
	node(:tam) {|i| i } 
	node("#{k}_url") { |i| i.attachment.url(k) }
end