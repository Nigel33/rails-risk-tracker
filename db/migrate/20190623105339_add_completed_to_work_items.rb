class AddCompletedToWorkItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :work_items, :completed, :boolean, :default => false
  end
end
