class WorkItemsController < ApplicationController 
  before_action :redirect_if_not_logged_in

  def update 
    work_item = WorkItem.find(params[:id])
    data = params[:complete]
    message = "The work item has been marked as "

    respond_to do |format| 
      format.js do 
        if data == 'true'
          message += "completed"
          work_item.update_column(:completed, true)
        else 
          message += "incomplete"
          work_item.update_column(:completed, false)
        end 
      end  
    end 

    flash[:notice] = message
    redirect_to root_path
  end 
  
    
    


end 