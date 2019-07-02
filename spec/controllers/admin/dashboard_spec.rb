require 'rails_helper'

describe Admin::DashboardController do 
	before(:each) { set_admin }

	describe "#index" do 
		it_behaves_like "require_sign_in" do 
			let(:action) { get :index }
		end 

		it_behaves_like "require_admin" do 
			let(:action) { get :index }
		end

		it "gets all users" do 
			Fabricate(:user)
			get :index

			expect(assigns(@users)['users'].count).to eq(2)
		end  
	end 
	
end 