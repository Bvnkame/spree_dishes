class AddRecipeLinkSpreeProduct < ActiveRecord::Migration
  def change
  	add_column :spree_products, :recipe_link, :string
  end
end
