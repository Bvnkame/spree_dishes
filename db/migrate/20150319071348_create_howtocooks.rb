class CreateHowtocooks < ActiveRecord::Migration
  def change
    create_table :howtocooks do |t|
    	t.integer :position
    	t.string :title
    	t.string :content
    	t.string :image_url
    	t.integer :product_id
      t.timestamps
    end
    add_foreign_key :howtocooks, :spree_products, column: 'product_id'
  end
end
