class CreateChemicalProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :chemical_properties do |t|
    	t.integer :work_item_id
    	t.integer :niche_id
    	t.text :summary
    	t.timestamps
    end
  end
end
