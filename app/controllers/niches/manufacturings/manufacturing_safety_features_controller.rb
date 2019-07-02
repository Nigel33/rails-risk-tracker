class Niches::Manufacturings::ManufacturingSafetyFeaturesController < ApplicationController 
	before_action :redirect_if_not_logged_in
	before_action :find_work_item
	before_action :find_manufacturing_safety_feature, only: [:edit, :update]


	def index
		redirect_to new_work_item_niches_Manufacturings_manufacturing_safety_feature_path
	end 

	def new 
		@manufacturing_safety_feature = ManufacturingSafetyFeature.new
	end 

	def create
		@manufacturing_safety_feature = create_object(ManufacturingSafetyFeature.new(manufacturing_safety_feature_params))
		
		if @manufacturing_safety_feature.save
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
		if @manufacturing_safety_feature.update(manufacturing_safety_feature_params)
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

	def find_manufacturing_safety_feature 
		@manufacturing_safety_feature = ManufacturingSafetyFeature.find(params[:id])
	end 

	def manufacturing_safety_feature_params 
		params.require(:manufacturing_safety_feature).permit!
	end 

	def create_object(obj_creator)
		obj_creator.niche = @work_item.niche 
		obj_creator.work_item = @work_item
		obj_creator
	end 
end 