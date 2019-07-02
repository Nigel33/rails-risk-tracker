class Niches::Manufacturings::ManufacturingPropertiesController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	before_action :find_manufacturing_property, only: [:edit, :update]


	def index
		redirect_to new_work_item_niches_manufacturings_manufacturing_property_path
	end 

	def new 
		@manufacturing_property = ManufacturingProperty.new
	end 

	def create
		@manufacturing_property = create_object(ManufacturingProperty.new(manufacturing_property_params))
		
		if @manufacturing_property.save
			flash[:notice] = "Your records have been saved"
			redirect_to work_item_niches_manufacturings_path(@work_item)
		else 
			flash[:error] = "Please fix the following error(s): "
			render :new
		end 
	end 

	def edit
	end 

	def update 
		if @manufacturing_property.update(manufacturing_property_params)
			flash[:notice] = "Your records have been saved"
			redirect_to work_item_niches_manufacturings_path(@work_item)
	 	else 
	 		flash[:error] = "Please fix the following error(s)"
	 		render :edit
	 	end 
	end 

	private 

	def find_work_item
		@work_item = WorkItem.find(params[:work_item_id])
	end 

	def find_manufacturing_property 
		@manufacturing_property = ManufacturingProperty.find(params[:id])
	end 

	def manufacturing_property_params 
		params.require(:manufacturing_property).permit!
	end 

	def create_object(obj_creator)
		obj_creator.niche = @work_item.niche 
		obj_creator.work_item = @work_item
		obj_creator
	end 
end 