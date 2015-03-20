class CreateWhatneeds < ActiveRecord::Migration
  def change
    create_table :whatneeds do |t|
    	t.string :name

      t.timestamps
    end
  end
end
