class RenameCostPricetoDishPrice < ActiveRecord::Migration
  def change
  	rename_column :spree_products, :cost_price, :dish_price
  end
end
