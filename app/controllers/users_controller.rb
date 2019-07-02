class UsersController < ApplicationController
	before_action :redirect_if_not_logged_in
	before_action :find_user

	def display_items
	end 

	def display_completed_items
	end 

	private 

	def find_user 
		@user = User.find(params[:user_id])
	end 
end 