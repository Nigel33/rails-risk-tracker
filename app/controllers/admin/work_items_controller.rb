class Admin::WorkItemsController < AdminsController 
	def index
	end 

	def new 
		@work_item = WorkItem.new
	end 

	def create
		@work_item = WorkItem.new(work_item_params)
		
		if @work_item.save 
			flash[:notice] = "You have successfully created a work item!"
			redirect_to new_admin_work_item_path
		else 
			flash[:error] = "Please fix the following error(s)"
			render :new
		end 
	end 

	def show 
		@work_item = WorkItem.find(params[:id])
	end 

	private 

	def work_item_params 
		params.require(:work_item).permit!
	end 
end 