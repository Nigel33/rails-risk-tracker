class ReviewsController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	
	def show

	end

	private 

	def find_work_item
		@work_item = WorkItem.find(params[:work_item_id])
	end

	
end 