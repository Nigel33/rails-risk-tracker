class Admin::DashboardController < AdminsController 
	def index 
		@users = User.all
		@completed_work_items = WorkItem.where(completed: true).order("due_date")
	end 
end 