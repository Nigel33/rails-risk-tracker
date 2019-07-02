Fabricator(:work_item) do 
	due_date { Faker::Date.forward(23) }
	company_id 2
	user_id 2
end 