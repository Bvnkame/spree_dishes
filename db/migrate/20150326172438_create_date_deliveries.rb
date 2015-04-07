class CreateDateDeliveries < ActiveRecord::Migration
  def change
    create_table :date_deliveries do |t|
    	t.integer :product_id
    	t.date :delivery_date
    	
      t.timestamps
    end
  end
end
