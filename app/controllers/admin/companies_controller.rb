class Admin::CompaniesController < AdminsController 
	def new
		@company = Company.new
	end 

	def create 
		@company = Company.new(company_params)
		
		if @company.save
			flash[:notice] = "A new company has been created"
			redirect_to new_admin_company_path
		else 
			flash[:error] = "Please fix the error(s):"
			render :new
		end 
	end 

	private 

	def company_params
		params.require(:company).permit!
	end 
end 