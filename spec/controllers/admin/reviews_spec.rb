require 'rails_helper'

describe Admin::ReviewsController do 
	describe "#new" do 
		let(:work_item) { Fabricate(:work_item) }

		before(:each) do 
			set_admin 
		end 

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new, params: { work_item_id: work_item.id} }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { get :new, params: { work_item_id: work_item.id} }
		end 

		it "creates a new instance of Company" do 
			get :new, params: { work_item_id: work_item.id}
			expect(assigns(:review)).to be_instance_of(Review)
		end 
	end

	describe "create" do 
		let(:work_item) { Fabricate(:work_item) }

		before(:each) do 
			set_admin 
		end 

		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: {review: Fabricate.attributes_for(:review), work_item_id: work_item.id} }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { post :create, params: {review: Fabricate.attributes_for(:review), work_item_id: work_item.id} }
		end 

		context "valid inputs" do 
			before(:each) { post :create, params: {review: Fabricate.attributes_for(:review), work_item_id: work_item.id} }

			it "redirects to the root path" do 
				expect(response).to redirect_to root_path
			end 

			it "creates a flash message" do 
				expect(flash[:notice]).to be_present
			end 

			it "creates a review" do 
				expect(Review.count).to eq(1)
			end 

			it "creates a review which is associated to a work item" do 
				expect(assigns(:review).work_item).to eq(work_item)
			end 
		end 

		context "invalid inputs" do 
			before(:each) { post :create, params: {review: Fabricate.attributes_for(:review, comment: nil), work_item_id: work_item.id} }
		
			it "renders the new template" do
				expect(response).to render_template :new
			end 

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create a review" do 
				expect(Review.count).to eq(0)
			end 
		end 
	end 

	describe "update" do 
		let(:work_item) { Fabricate(:work_item) }
		let(:review) { Fabricate(:review) }

		before(:each) do 
			set_admin 
		end 

		it_behaves_like "require_sign_in" do 
			let(:action) { patch :update, params: { work_item_id: work_item.id, id: review.id }}
		end  

		it_behaves_like "require_admin" do 
			let(:action) { patch :update, params: { work_item_id: work_item.id, id: review.id }}
		end 

		context "valid inputs" do 
			before(:each) do 
				new_attr = Fabricate.attributes_for(:review, comment: 'new comment')
				patch :update, params: { work_item_id: work_item.id, review: new_attr, id: review.id }
				review.reload
			end 

			it "redirects to the root path" do 
				expect(response).to redirect_to root_path
			end  

			it "creates a flash message" do 
				expect(flash[:notice]).to be_present
			end 

			it "updates the review" do 
				expect(assigns(:review).comment).to eq('new comment')
			end  
		end 

		context "invalid inputs" do 
			before(:each) do 
				new_attr = Fabricate.attributes_for(:review, comment: nil)
				patch :update, params: { work_item_id: work_item.id, review: new_attr, id: review.id }
				review.reload
			end 

			it "renders the edit template" do 
				expect(response).to render_template :edit
			end  

			it "creates a flash error" do 
				expect(flash[:error]).to be_present
			end 

			
		end 
	end 
end 