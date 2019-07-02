require 'rails_helper'

describe PagesController do 
	let (:user ) { Fabricate(:user) }

	describe "#index" do 
		it "redirects to the dashboard if user is an admin" do
			set_admin
			get :index
			expect(response).to redirect_to admin_dashboard_path
		end 

		it "redirects to the user's work queue if regular user" do 
			set_current_user(user)
			get :index
			expect(response).to redirect_to user_work_items_path(user)
		end 
	end 
end 