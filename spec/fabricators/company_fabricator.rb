Fabricator(:company) do 
	name { Faker::Lorem.words(2).join(' ') }
	address { Faker::Address.full_address }
	niche { Fabricate(:niche) }
end 
