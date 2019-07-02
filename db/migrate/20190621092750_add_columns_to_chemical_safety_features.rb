class AddColumnsToChemicalSafetyFeatures < ActiveRecord::Migration[5.2]
  def change
  	add_column :chemical_safety_features, :fire_extinguisher, :boolean, :default => false
  	add_column :chemical_safety_features, :first_aid_kit, :boolean, :default => false
  	add_column :chemical_safety_features, :ppe, :boolean, :default => false
		add_column :chemical_safety_features, :oily_waste_bin, :boolean, :default => false
		add_column :chemical_safety_features, :safety_cabinet, :boolean, :default => false
		add_column :chemical_safety_features, :lock_tag, :boolean, :default => false
		add_column :chemical_safety_features, :eye_washer, :boolean, :default => false
		add_column :chemical_safety_features, :inspections, :string
		add_column :chemical_safety_features, :comments, :text
		add_column :chemical_safety_features, :grade, :text
  end
end
