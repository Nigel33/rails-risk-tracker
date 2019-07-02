require 'rails_helper'

describe UsersController do 
	let (:alice) { Fabricate(:user) }
	before(:each) do
		@work_item = Fabricate(:work_item, user: alice) 
		set_current_user(alice)
	end 
	
	describe "#display_items" do 
		it_behaves_like "require_sign_in" do 
			let(:action) { get :display_items, params: { user_id: alice.id } }
		end 

		it "pulls out work items from user" do 
			get :display_items, params: { user_id: alice.id }
			expect(assigns(:user)).to be_instance_of(User)
			expect(assigns(:user).work_items.count).to eq(1)
		end 
	end 
end 