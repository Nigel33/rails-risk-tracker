class ChemicalEquipment < ActiveRecord::Base 
	belongs_to :niche
	validates :work_item_id, uniqueness: true
	belongs_to :work_item
	validates_presence_of :summary
end 