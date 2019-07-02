class Niche < ActiveRecord::Base 
	has_many :companies
	has_many :chemical_safety_features
	has_many :chemical_equipments
	has_many :chemical_properties

	has_many :manufacturing_safety_features
	has_many :manufacturing_equipments
	has_many :manufacturing_properties
end 