Fabricator(:user) do 
end 

Fabricator(:admin, from: :user) do 
	admin  true 
end 