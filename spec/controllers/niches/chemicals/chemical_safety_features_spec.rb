require 'rails_helper'

describe Niches::Chemicals::ChemicalSafetyFeaturesController do 
	let (:niche) { Fabricate(:niche) }
	let (:company) { Fabricate(:company, niche: niche) }
	let (:chemical_safety_feature) { Fabricate(:chemical_safety_feature, work_item: work_item) }
	let (:work_item) { Fabricate(:work_item, company: company) }
	
	describe "#new" do
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new, params: { work_item_id: work_item.id } }
		end 

		it "creates a new instance of ChemicalSafetyFeature" do 
			get :new, params: { work_item_id: work_item.id }
			expect(assigns(:chemical_safety_feature)).to be_instance_of(ChemicalSafetyFeature)
		end 
	end

	describe "#edit" do 
		before(:each) { set_current_user }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :edit, params: { work_item_id: work_item.id, id: chemical_safety_feature.id } }
		end 

		it "gets an existing ChemicalSafetyFeature object" do 
			get :edit, params: { work_item_id: work_item.id, id: chemical_safety_feature.id }
			expect(assigns(:chemical_safety_feature)).to be_instance_of(ChemicalSafetyFeature)
			expect(ChemicalSafetyFeature.count).to eq(1)
		end 
	end 
	

	describe "#create" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: { work_item_id: work_item.id } }
		end 

		context "valid inputs" do 
			 before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, chemical_safety_feature: Fabricate.attributes_for(:chemical_safety_feature) }
			 end 

			it "redirects to work_item page" do 
				expect(response).to redirect_to work_item_niches_chemicals_path(work_item)
			end 

			it "creates a flash success message" do 
				expect(flash[:notice]).to be_present
			end 

			it "creates a ChemicalSafetyFeature object" do 
				expect(ChemicalSafetyFeature.count).to eq(1)
			end 

			it "associates the chemical ChemicalSafetyFeature obj with the work item" do 
				expect(assigns(:chemical_safety_feature).work_item).to eq(work_item)
			end 

			it "associates the ChemicalSafetyFeature obj with a niche" do 
				expect(assigns(:chemical_safety_feature).niche).to eq(niche)
			end 
		end 

		context "invalid inputs" do 
			before(:each) do 
			 		post :create, params: { work_item_id: work_item.id, chemical_safety_feature: Fabricate.attributes_for(:chemical_safety_feature, summary: nil) }
			 end 

			it "renders the :new template" do 
				expect(response).to render_template :new
			end

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create a ChemicalSafetyFeature object" do 
				expect(ChemicalSafetyFeature.count).to eq(0)
			end 
		end 
	end 

	describe "#update" do 
		before(:each) { set_current_user }
			
		it_behaves_like "require_sign_in" do 
			let(:action) { patch :update, params: { work_item_id: work_item.id, chemical_safety_feature: Fabricate.attributes_for(:chemical_safety_feature), id: chemical_safety_feature.id } }
		end 

		context "valid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:chemical_safety_feature, summary: 'new summary')
				patch :update, params: { work_item_id: work_item.id, chemical_safety_feature: new_attr, id: chemical_safety_feature.id }
				chemical_safety_feature.reload
			end 

			it "redirects to work item page" do 
				expect(response).to redirect_to work_item_niches_chemicals_path(work_item)
			end 

			it "creates a flash notice after update" do 
				expect(flash[:notice]).to be_present
			end 

			it "updates the model" do 
				expect(assigns(:chemical_safety_feature).summary).to eq('new summary')
			end 
		end

		context "invalid inputs" do 
			before(:each) do
				new_attr = Fabricate.attributes_for(:chemical_safety_feature, summary: nil)
				patch :update, params: { work_item_id: work_item.id, chemical_safety_feature: new_attr, id: chemical_safety_feature.id }
				chemical_safety_feature.reload
			end 

			it "renders the edit page" do 
				expect(response).to render_template :edit
			end 

			it "creates a flash error" do 
				expect(flash[:error]).to be_present
			end 

			it "does not update the model" do 
				expect(assigns(:chemical_safety_feature).summary).not_to eq(nil)
			end 
		end 

		

	end 
end 