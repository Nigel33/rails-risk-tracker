require 'rails_helper'

describe ChemicalSafetyFeature do 
	describe "associations" do 
		it { should belong_to :work_item }
		it { should belong_to :niche }
		it { should validate_uniqueness_of :work_item_id }
		it { should validate_presence_of :summary }
	end 
end 