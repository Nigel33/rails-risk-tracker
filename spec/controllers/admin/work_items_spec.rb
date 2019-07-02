require 'rails_helper' 

describe Admin::WorkItemsController do 
	describe "#new" do 
		before(:each) { set_admin }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { get :new }
		end 

		it "creates a new instance of Work Item" do 
			get :new
			expect(assigns(:work_item)).to be_instance_of(WorkItem)
		end 
	end 

	describe "#create" do 
		before(:each) { set_admin }

		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: { work_item: Fabricate.attributes_for(:work_item)} }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { post :create, params: {work_item: Fabricate.attributes_for(:work_item)} }
		end 

		context "valid inputs" do 
			before(:each) do 
				post :create, params: { work_item: Fabricate.attributes_for(:work_item) }
			end 

			it "redirects to :new" do 
				expect(response).to redirect_to new_admin_work_item_path
			end  

			it "creates a flash message" do 
				expect(flash[:notice]).to be_present 
			end 

			it "creates an instance of Company" do 
				expect(WorkItem.count).to eq(1)
			end 

		end 

		context "invalid inputs" do 
			before(:each) do 
				post :create, params: { work_item: Fabricate.attributes_for(:work_item, due_date: nil) }
			end 

			it "renders the :new template" do 
				expect(response).to render_template :new
			end 

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create an instance of Company" do 
				expect(WorkItem.count).to eq(0)
			end 
		end 
	end 
end 