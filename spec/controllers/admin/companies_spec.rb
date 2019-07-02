require 'rails_helper' 

describe Admin::CompaniesController do 
	describe "#new" do 
		before(:each) { set_admin }

		it_behaves_like "require_sign_in" do 
			let(:action) { get :new }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { get :new }
		end 

		it "creates a new instance of Company" do 
			get :new
			expect(assigns(:company)).to be_instance_of(Company)
		end 
	end 

	describe "#create" do 
		before(:each) { set_admin }

		it_behaves_like "require_sign_in" do 
			let(:action) { post :create, params: {company: Fabricate.attributes_for(:company)} }
		end  

		it_behaves_like "require_admin" do 
			let(:action) { post :create, params: {company: Fabricate.attributes_for(:company)} }
		end 

		context "valid inputs" do 
			before(:each) do 
				post :create, params: { company: Fabricate.attributes_for(:company) }
			end 

			it "redirects to :new" do 
				expect(response).to redirect_to new_admin_company_path
			end  

			it "creates a flash message" do 
				expect(flash[:notice]).to be_present 
			end 

			it "creates an instance of Company" do 
				expect(Company.count).to eq(1)
			end 

		end 

		context "invalid inputs" do 
			before(:each) do 
				post :create, params: { company: Fabricate.attributes_for(:company, name: nil) }
			end 

			it "renders the :new template" do 
				expect(response).to render_template :new
			end 

			it "creates a flash error message" do 
				expect(flash[:error]).to be_present
			end 

			it "does not create an instance of Company" do 
				expect(Company.count).to eq(0)
			end 
		end 
	end 
end 