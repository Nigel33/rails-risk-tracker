class Niches::Chemicals::ChemicalSafetyFeaturesController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	before_action :find_chemical_safety_feature, only: [:edit, :update]


	def index
		redirect_to new_work_item_niches_chemicals_chemical_safety_feature_path
	end 

	def new 
		@chemical_safety_feature = ChemicalSafetyFeature.new
	end 

	def create
		@chemical_safety_feature = create_object(ChemicalSafetyFeature.new(chemical_safety_feature_params))
		
		if @chemical_safety_feature.save
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
		if @chemical_safety_feature.update(chemical_safety_feature_params)
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

	def find_chemical_safety_feature 
		@chemical_safety_feature = ChemicalSafetyFeature.find(params[:id])
	end 

	def chemical_safety_feature_params 
		params.require(:chemical_safety_feature).permit!
	end 

	def create_object(obj_creator)
		obj_creator.niche = @work_item.niche 
		obj_creator.work_item = @work_item
		obj_creator
	end 
end 