require 'rails_helper'

describe Admin::UsersController do 
	let (:user) { Fabricate(:user) }
	before(:each) { set_admin }

	describe "#index" do 
		it_behaves_like "require_sign_in" do 
			let(:action) { get :show, params: {id: user.id} }
		end 

		it_behaves_like "require_admin" do 
			let(:action) { get :show, params: {id: user.id} }
		end

		it "gets the user" do 
			get :show, params: {id: user.id}
			expect(assigns(:user)).to eq(user)
		end 
	end 
	
end 