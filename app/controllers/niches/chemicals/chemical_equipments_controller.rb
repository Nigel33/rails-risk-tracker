class Niches::Chemicals::ChemicalEquipmentsController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	before_action :find_chemical_equipment, only: [:edit, :update]


	def index
		redirect_to new_work_item_niches_chemicals_chemical_equipment_path
	end 

	def new 
		@chemical_equipment = ChemicalEquipment.new
	end 

	def create
		@chemical_equipment = create_object(ChemicalEquipment.new(chemical_equipment_params))
		
		if @chemical_equipment.save
			flash[:notice] = "Your records have been saved"
			redirect_to work_item_niches_chemicals_path(@work_item)
		else 
			flash[:error] = "Please fix the following error(s): "
			render :new
		end 
	end 

	def edit
	end 

	def update 
		if @chemical_equipment.update(chemical_equipment_params)
			flash[:notice] = "Your records have been saved"
			redirect_to work_item_niches_chemicals_path(@work_item)
	 	else 
	 		flash[:error] = "Please fix the following error(s)"
	 		render :edit
	 	end 
	end 

	private 

	def find_work_item
		@work_item = WorkItem.find(params[:work_item_id])
	end 

	def find_chemical_equipment 
		@chemical_equipment = ChemicalEquipment.find(params[:id])
	end 

	def chemical_equipment_params 
		params.require(:chemical_equipment).permit!
	end 

	def create_object(obj_creator)
		obj_creator.niche = @work_item.niche 
		obj_creator.work_item = @work_item
		obj_creator
	end 
end 