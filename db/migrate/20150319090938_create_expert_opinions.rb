class CreateExpertOpinions < ActiveRecord::Migration
  def change
    create_table :expert_opinions do |t|
    	t.string :name
    	t.string :image
    	t.string :prefix
    	t.text :post

      t.timestamps
    end
  end
end
