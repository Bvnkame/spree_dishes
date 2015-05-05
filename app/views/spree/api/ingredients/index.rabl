object false
node(:count) { @ingredients.count }
child(@ingredients => :ingredients) do
  extends "spree/api/ingredient/show"
end

