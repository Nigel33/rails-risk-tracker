class Review < ActiveRecord::Base
	belongs_to :work_item
	validates :work_item_id, uniqueness: true
	validates_presence_of :accuracy, :timeliness, :comment, :detail, :grammar
end 

