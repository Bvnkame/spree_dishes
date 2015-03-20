object false
node(:count) { @products.count }
child(@products => :products) do
  extends "spree/api/products/small_show"
end
