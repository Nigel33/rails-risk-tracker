class Admin::ReviewsController < AdminsController 
	before_action :find_work_item

	def new
		@review = Review.new
	end

	def edit 
		@review = Review.find(params[:id])
	end 

	def create 
		@review = Review.new(review_params)
		@review.work_item_id = @work_item.id

		if @review.save
			flash[:notice] = "You have successfully left a review for work item #{@work_item.id}"
			redirect_to root_path
		else 
			flash[:error] = "Please fix the following errors(s)"
			render :new
		end 
	end 

	def update
		@review = Review.find(params[:id])

		if @review.update(review_params)
			flash[:notice] = "The review has been updated"
			redirect_to root_path
		else 
			flash[:error] = "Please fix the following error(s)"
			render :edit
		end 
	end

	private 

	def find_work_item
		@work_item = WorkItem.find(params[:work_item_id])
	end 

	def review_params 
		params.require(:review).permit!
	end 

end 