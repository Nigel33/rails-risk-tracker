class SessionsController < ApplicationController 
	before_action :redirect_if_logged_in, only: [:new]

	def new 
	end 

	def create 
		user = User.find_by(email: params[:email])

		if user && user.authenticate(params[:password]) 
			session[:user_id] = user.id
			flash[:notice] = "You have successfully logged in!"
			if user.admin?
				redirect_to admin_dashboard_path 
			else
				redirect_to user_work_items_path(user)
			end 
		else 
			flash[:error] = "Something is wrong with your email or password"
			render :new 
		end 
	end

	def destroy 
		session[:user_id] = nil 
		flash[:notice] = "You have logged out!"
		redirect_to login_path
	end 
end 