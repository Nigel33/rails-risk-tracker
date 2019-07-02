class PagesController < ApplicationController 
	def index 
		if logged_in?
			if current_user.admin? 
				redirect_to admin_dashboard_path
			else 
				redirect_to user_work_items_path(current_user)
			end 
		else 
			redirect_to login_path
		end 
	end 
end 