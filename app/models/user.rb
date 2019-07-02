class User < ActiveRecord::Base
	has_many :work_items
	has_many :companies, through: :work_items 

	has_secure_password validations: false

	def accuracy_average 
		 get_average(reviews_array, :accuracy) 
	end 

	def timeliness_average
		get_average(reviews_array, :timeliness)
	end 

	def detail_average
		get_average(reviews_array, :detail)
	end 

	def grammar_average
		get_average(reviews_array, :grammar)
	end 

	def total_score
		(scores_array.reduce(&:+) / scores_array.length).round(2)
	end 

	private

	def get_average(array, symbol)
		reviews_array.empty? ? 'NA' : (array.map(&symbol).reduce(&:+) / array.length).round(2)
	end 

	def reviews_array
		work_items.map(&:review).select(&:present?)
	end 

	def scores_array
		[accuracy_average, timeliness_average, detail_average, grammar_average]
	end 
end 