class CreateWorkItems < ActiveRecord::Migration[5.2]
  def change
    create_table :work_items do |t|
    	t.integer :user_id
    	t.integer :company_id
    	t.date :due_date
    	t.timestamps
    end
  end
end
