module ApplicationHelper
	def new_or_edit_path(work_item, obj, route)
		if obj.present? 
			send("edit_work_item_niches_#{route}_path", work_item, obj) 
		else 
			send("new_work_item_niches_#{route}_path", work_item) 
		end 
	end 

	def new_or_edit_review(work_item, obj)
		if obj.present?
			edit_admin_work_item_review_path(work_item, obj)
		else 
			new_admin_work_item_review_path(work_item)
		end 
	end 

	def pending_items_count(user)
		user.work_items.where(completed: false).count
	end 

	def completed_items_count(user)
		user.work_items.where(completed: true).count
	end 
end
