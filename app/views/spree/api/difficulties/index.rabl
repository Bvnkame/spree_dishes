object false
node(:count) { @difficulties.count }
child(@difficulties => :difficulties) do
  attributes :id, :name
end

