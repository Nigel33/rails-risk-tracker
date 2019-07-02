

class CompaniesController < ApplicationController 
	def show
		@company = Company.find(params[:id])
		respond_to do |format|
			format.js do 
				render json: Serializer.new(@company).serialize
			end 
		end 
	end 
end 