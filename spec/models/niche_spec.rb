require 'rails_helper'

describe Niche do 
	describe "associations" do 
		it { should have_many :companies }
		it { should have_many :chemical_safety_features }
		it { should have_many :chemical_equipments }
		it { should have_many :chemical_properties }
		it { should have_many :manufacturing_safety_features }
		it { should have_many :manufacturing_equipments }
	end 
end 