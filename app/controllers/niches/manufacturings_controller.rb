class Niches::ManufacturingsController < ApplicationController 
	def index
		@work_item = WorkItem.find(params[:work_item_id])
	end 
end 