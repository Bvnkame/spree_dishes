class DeleteDateDelivery < ActiveRecord::Migration
  def change
  	remove_column :spree_products, :date_delivery
  	remove_column :spree_products, :cooking_time
  	add_column :spree_products, :time_cook, :integer
  end
end
