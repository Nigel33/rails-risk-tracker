require 'rails_helper'

describe Niches::Manufacturings::ManufacturingPropertiesController do 
	let (:niche) { Fabricate(:niche) }
	let (:company) { Fabricate(:company, niche: niche) }
	let (:manufacturing_property) { Fabricate(:manufacturing_property, work_item: work_item) }
	let (:work_item) { Fabricate(:work_item, company: company) }
	
	describe "#new" do
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new, params: { work_item_id: work_item.id } }
		end 

		it "creates a new instance of ManufacturingProperty" do 
			get :new, params: { work_item_id: work_item.id }
			expect(assigns(:manufacturing_property)).to be_instance_of(ManufacturingProperty)
		end 
	end

	describe "#edit" do 
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :edit, params: { work_item_id: work_item.id, id: manufacturing_property.id } }
		end 

		it "gets an existing ManufacturingProperty object" do 
			get :edit, params: { work_item_id: work_item.id, id: manufacturing_property.id }
			expect(assigns(:manufacturing_property)).to be_instance_of(ManufacturingProperty)
			expect(ManufacturingProperty.count).to eq(1)
		end 
	end 
	

	describe "#create" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: { work_item_id: work_item.id } }
		end 

		context "valid inputs" do 
			 before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, manufacturing_property: Fabricate.attributes_for(:manufacturing_property) }
			 end 

			it "redirects to work_item page" do 
				expect(response).to redirect_to work_item_niches_manufacturings_path(work_item)
			end 

			it "creates a flash success message" do 
				expect(flash[:notice]).to be_present
			end 

			it "creates a ManufacturingProperty object" do 
				expect(ManufacturingProperty.count).to eq(1)
			end 

			it "associates the manufacturing ManufacturingProperty obj with the work item" do 
				expect(assigns(:manufacturing_property).work_item).to eq(work_item)
			end 

			it "associates the ManufacturingProperty obj with a niche" do 
				expect(assigns(:manufacturing_property).niche).to eq(niche)
			end 
		end 

		context "invalid inputs" do 
			before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, manufacturing_property: Fabricate.attributes_for(:manufacturing_property, summary: nil) }
			 end 

			it "renders the :new template" do 
				expect(response).to render_template :new
			end

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create a ManufacturingProperty object" do 
				expect(ManufacturingProperty.count).to eq(0)
			end 
		end 
	end 

	describe "#update" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { patch :update, params: { work_item_id: work_item.id, manufacturing_property: Fabricate.attributes_for(:manufacturing_property), id: manufacturing_property.id } }
		end 

		context "valid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:manufacturing_property, summary: 'new summary')
				patch :update, params: { work_item_id: work_item.id, manufacturing_property: new_attr, id: manufacturing_property.id }
				manufacturing_property.reload
			end 

			it "redirects to work item page" do 
				expect(response).to redirect_to work_item_niches_manufacturings_path(work_item)
			end 

			it "creates a flash notice after update" do 
				expect(flash[:notice]).to be_present
			end 

			it "updates the model" do 
				expect(assigns(:manufacturing_property).summary).to eq('new summary')
			end 
		end

		context "invalid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:manufacturing_property, summary: nil)
				patch :update, params: { work_item_id: work_item.id, manufacturing_property: new_attr, id: manufacturing_property.id }
				manufacturing_property.reload
			end 

			it "renders the edit page" do 
				expect(response).to render_template :edit
			end 

			it "creates a flash error" do 
				expect(flash[:error]).to be_present
			end 

			it "does not update the model" do 
				expect(assigns(:manufacturing_property).summary).not_to eq(nil)
			end 
		end 

		

	end 
end 