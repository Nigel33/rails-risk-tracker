require 'rails_helper'

describe SessionsController do 
	describe "#get" do 
		it "redirects to root path if user is logged in" do 
			alice = Fabricate(:user)
			set_current_user(alice)
			get :new
			expect(response).to redirect_to root_path
		end 
	end 

	describe "#create" do 
		context "valid input for normal user" do 
			before(:each) do 
				@alice = Fabricate(:user, email: 'alice@example.com', password: 'password')
				post :create, params: { email: 'alice@example.com', password: 'password' } 
			end   

			it "creates a session if user is authenticated" do 
				expect(session[:user_id]).to eq(@alice.id)
			end 

			it "creates a succesful flash message" do 
				expect(flash[:notice]).to be_present
			end

			it "redirects to the user's work queue" do 
				expect(response).to redirect_to user_work_items_path(@alice)
			end 
		end 
			
		context "valid input for admin" do 
			it "redirects to the admin dashboard" do 
				@alice = Fabricate(:user, email: 'alice@example.com', password: 'password', admin: true)
				post :create, params: { email: 'alice@example.com', password: 'password' } 
				expect(response).to redirect_to admin_dashboard_path 
			end 
		end 
		
		context "invalid input" do 
			before(:each) do 
				@alice = Fabricate(:user, email: 'alice@example.com', password: 'password')
				post :create, params: { email: 'alice@example.com', password: 'abc' } 
			end 

			it "does not create a session" do 
				expect(session[:user_id]).to be_nil
			end 

			it "re renders the login page" do 
				expect(response).to render_template(:new)
			end 

			it "creates an error flash message" do 
				expect(flash[:error]).to be_present
			end 
		end 
	end

	describe "#destroy" do 
		before(:each) { post :destroy }
		
		it "removes the session key" do 
			expect(session[:user_id]).to be_nil
		end 

		it "redirects to the login page" do 
			expect(response).to redirect_to login_path
		end 

		it "creates a flash message" do 
			expect(flash[:notice]).to be_present
		end 
	end  
end 