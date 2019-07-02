Fabricator(:review) do 
	accuracy 95.5
	timeliness 87.54
	detail 89.54
	grammar 96.7
	comment { Faker::Lorem.paragraph(2) }
end 