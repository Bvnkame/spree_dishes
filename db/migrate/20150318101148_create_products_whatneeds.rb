class CreateProductsWhatneeds < ActiveRecord::Migration
  def change
    create_table :spree_products_whatneeds do |t|
      t.integer :product_id
      t.integer :whatneed_id
    end

    add_foreign_key :spree_products_whatneeds, :spree_products, column: 'product_id'
    add_foreign_key :spree_products_whatneeds, :whatneeds
  end
end
