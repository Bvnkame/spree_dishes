object false
node(:count) { @whatneeds.count }
child(@whatneeds => :whatneeds) do
  attributes :id, :name
end

