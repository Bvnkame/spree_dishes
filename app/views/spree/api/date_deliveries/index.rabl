object false
node(:count) { @date_deliveries.count }
child(@date_deliveries => :date_deliveries) do
  attributes :id, :delivery_date, :product_id
end

