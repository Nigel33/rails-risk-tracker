class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.integer :work_item_id
    	t.timestamps 
    end
  end
end
