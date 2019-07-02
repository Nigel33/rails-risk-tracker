require 'rails_helper'

describe WorkItem do 
	let(:niche) { Fabricate(:niche, name: 'chemical') }
	let(:alice) { Fabricate(:user, full_name: 'Alice Doe') }
	let(:company) { Fabricate(:company, niche: niche, name: 'oglico') }
	let(:work_item) { Fabricate(:work_item, company: company, user: alice) }

	describe "associations" do 
		it { should belong_to :user }
		it { should belong_to :company }
		it { should have_one :review }
		it { should have_one :chemical_safety_feature }
		it { should have_one :chemical_equipment }
		it { should have_one :chemical_property }
		it { should have_one :manufacturing_safety_feature }
		it { should have_one :manufacturing_equipment }
		it { should have_one :manufacturing_property }
		it { should validate_presence_of :company_id }
		it { should validate_presence_of :user_id }
		it { should validate_presence_of :due_date }

	end 

	describe "#company_name" do 
		it "should return the name of the company" do 
			expect(work_item.company_name).to eq('oglico')
		end 
	end 

	describe "#niche_name" do 
		it "should return the name of the niche" do 
			expect(work_item.niche_name).to eq('chemical')
		end 
	end 

	describe "#user_full_name" do 
		it "should return the full name of the consultant" do 
			expect(work_item.user_full_name).to eq('Alice Doe')
		end 
	end 
end 