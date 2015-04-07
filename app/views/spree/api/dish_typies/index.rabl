object false
node(:count) { @dish_typies.count }
child(@dish_typies => :dish_typies) do
  attributes :id, :name
end

