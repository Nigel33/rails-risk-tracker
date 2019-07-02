require 'rails_helper'

describe Niches::Manufacturings::ManufacturingSafetyFeaturesController do 
	let (:niche) { Fabricate(:niche) }
	let (:company) { Fabricate(:company, niche: niche) }
	let (:manufacturing_safety_feature) { Fabricate(:manufacturing_safety_feature, work_item: work_item) }
	let (:work_item) { Fabricate(:work_item, company: company) }
	
	describe "#new" do
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new, params: { work_item_id: work_item.id } }
		end 

		it "creates a new instance of ManufacturingSafetyFeature" do 
			get :new, params: { work_item_id: work_item.id }
			expect(assigns(:manufacturing_safety_feature)).to be_instance_of(ManufacturingSafetyFeature)
		end 
	end

	describe "#edit" do 
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :edit, params: { work_item_id: work_item.id, id: manufacturing_safety_feature.id } }
		end 

		it "gets an existing ManufacturingSafetyFeature object" do 
			get :edit, params: { work_item_id: work_item.id, id: manufacturing_safety_feature.id }
			expect(assigns(:manufacturing_safety_feature)).to be_instance_of(ManufacturingSafetyFeature)
			expect(ManufacturingSafetyFeature.count).to eq(1)
		end 
	end 
	

	describe "#create" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: { work_item_id: work_item.id } }
		end 

		context "valid inputs" do 
			 before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, manufacturing_safety_feature: Fabricate.attributes_for(:manufacturing_safety_feature) }
			 end 

			it "redirects to work_item page" do 
				expect(response).to redirect_to work_item_niches_manufacturings_path(work_item)
			end 

			it "creates a flash success message" do 
				expect(flash[:notice]).to be_present
			end 

			it "creates a ManufacturingSafetyFeature object" do 
				expect(ManufacturingSafetyFeature.count).to eq(1)
			end 

			it "associates the manufacturing ManufacturingSafetyFeature obj with the work item" do 
				expect(assigns(:manufacturing_safety_feature).work_item).to eq(work_item)
			end 

			it "associates the ManufacturingSafetyFeature obj with a niche" do 
				expect(assigns(:manufacturing_safety_feature).niche).to eq(niche)
			end 
		end 

		context "invalid inputs" do 
			before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, manufacturing_safety_feature: Fabricate.attributes_for(:manufacturing_safety_feature, summary: nil) }
			 end 

			it "renders the :new template" do 
				expect(response).to render_template :new
			end

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create a ManufacturingSafetyFeature object" do 
				expect(ManufacturingSafetyFeature.count).to eq(0)
			end 
		end 
	end 

	describe "#update" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { patch :update, params: { work_item_id: work_item.id, manufacturing_safety_feature: Fabricate.attributes_for(:manufacturing_safety_feature), id: manufacturing_safety_feature.id } }
		end 

		context "valid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:manufacturing_safety_feature, summary: 'new summary')
				patch :update, params: { work_item_id: work_item.id, manufacturing_safety_feature: new_attr, id: manufacturing_safety_feature.id }
				manufacturing_safety_feature.reload
			end 

			it "redirects to work item page" do 
				expect(response).to redirect_to work_item_niches_manufacturings_path(work_item)
			end 

			it "creates a flash notice after update" do 
				expect(flash[:notice]).to be_present
			end 

			it "updates the model" do 
				expect(assigns(:manufacturing_safety_feature).summary).to eq('new summary')
			end 
		end

		context "invalid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:manufacturing_safety_feature, summary: nil)
				patch :update, params: { work_item_id: work_item.id, manufacturing_safety_feature: new_attr, id: manufacturing_safety_feature.id }
				manufacturing_safety_feature.reload
			end 

			it "renders the edit page" do 
				expect(response).to render_template :edit
			end 

			it "creates a flash error" do 
				expect(flash[:error]).to be_present
			end 

			it "does not update the model" do 
				expect(assigns(:manufacturing_safety_feature).summary).not_to eq(nil)
			end 
		end 

		

	end 
end 