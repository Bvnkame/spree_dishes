class AddExpert < ActiveRecord::Migration
  def change
  	add_column :spree_products, :bm_expert_id, :integer
  	remove_column :spree_products, :expert_opinion_id
  end
end
