require 'rails_helper' 

describe Company do 
	describe "associations" do 
		it { should have_many :work_items }
		it { should belong_to :niche }
		it { should have_many :users }
		it { should validate_presence_of :name }
		it { should validate_presence_of :address }
		it { should validate_presence_of :niche }
		it { should validate_uniqueness_of :name }
	end 
end 