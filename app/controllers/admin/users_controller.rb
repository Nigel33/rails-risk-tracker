class Admin::UsersController < AdminsController 
	def show 
		@user = User.find(params[:id])
	end 
end 