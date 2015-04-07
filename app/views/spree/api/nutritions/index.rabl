object false
node(:count) { @nutritions.count }
child(@nutritions => :nutritions) do
  attributes :id, :name
end

