require 'rails_helper'

describe Niches::ChemicalsController do 
	let(:work_item) { Fabricate(:work_item) } 

	describe "#index" do 
		before(:each) { get :index, params: { work_item_id: work_item.id } }

		it "gets the @work_item which is an instance of WorkItem" do 
			expect(assigns(:work_item)).to be_instance_of(WorkItem)
		end 
	end 
end 