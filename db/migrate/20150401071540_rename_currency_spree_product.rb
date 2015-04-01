class RenameCurrencySpreeProduct < ActiveRecord::Migration
  def change
  	rename_column :spree_products, :currency, :dish_currency
  end
end
