class Niches::Manufacturings::ManufacturingEquipmentsController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	before_action :find_manufacturing_equipment, only: [:edit, :update]


	def index
		redirect_to new_work_item_niches_manufacturings_manufacturing_equipment_path
	end 

	def new 
		@manufacturing_equipment = ManufacturingEquipment.new
	end 

	def create
		@manufacturing_equipment = create_object(ManufacturingEquipment.new(manufacturing_equipment_params))
		
		if @manufacturing_equipment.save
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
		if @manufacturing_equipment.update(manufacturing_equipment_params)
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

	def find_manufacturing_equipment 
		@manufacturing_equipment = ManufacturingEquipment.find(params[:id])
	end 

	def manufacturing_equipment_params 
		params.require(:manufacturing_equipment).permit!
	end 

	def create_object(obj_creator)
		obj_creator.niche = @work_item.niche 
		obj_creator.work_item = @work_item
		obj_creator
	end 
end 