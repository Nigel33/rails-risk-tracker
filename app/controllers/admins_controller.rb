class AdminsController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :require_admin

	def require_admin 
    if !current_user.admin?
      flash[:error] = "You are not authorized to do that"
      redirect_to root_path
    end 
  end 
end 