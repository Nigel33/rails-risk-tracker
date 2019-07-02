shared_examples "require_sign_in" do 
	it "redirects to login page" do 
		session[:user_id] = nil
		action
		expect(response).to redirect_to login_path 
	end 
end 

shared_examples "require_admin" do 
	it "redirects to root_path" do 
		session[:user_id] = Fabricate(:user).id
		action
		expect(response).to redirect_to root_path 
	end 
end 