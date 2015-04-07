class AddDetailsToSpreeProduct < ActiveRecord::Migration
  def change
  	add_column :spree_products, :date_delivery, :date
  	add_column :spree_products, :cost_price, :decimal, precision: 10, scale: 2
  	add_column :spree_products, :currency, :string
  	add_column :spree_products, :story, :text
  	add_column :spree_products, :difficulty_id, :integer
  	add_column :spree_products, :cooking_time, :string
  	add_column :spree_products, :expert_opinion_id, :integer
  	add_column :spree_products, :dish_type_id, :integer
  end    
end
