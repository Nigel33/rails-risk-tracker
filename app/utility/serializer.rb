class Serializer
	attr_reader :obj

	def initialize(obj)
		@obj = obj
	end 

	def serialize
		result_hash = obj.attributes
		result_hash['niche'] = niche
		result_hash
	end 

	private

	def niche 
		Niche.find(obj['niche_id']).name
	end 
end 