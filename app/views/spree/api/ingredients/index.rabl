object false
node(:count) { @ingredients.count }
child(@ingredients => :ingredients) do
  attributes :id, :name
end

