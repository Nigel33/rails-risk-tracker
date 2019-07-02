class WorkItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	has_one :review, dependent: :destroy

	has_one :chemical_safety_feature, dependent: :destroy
	has_one :chemical_equipment, dependent: :destroy
	has_one :chemical_property, dependent: :destroy  

	has_one :manufacturing_safety_feature, dependent: :destroy
	has_one :manufacturing_equipment, dependent: :destroy
	has_one :manufacturing_property, dependent: :destroy

	delegate :name, to: :company, prefix: :company
	delegate :full_name, to: :user, prefix: :user
	delegate :niche, to: :company

	validates_presence_of :due_date, :company_id, :user_id

	def niche_name 
		niche.name
	end 


end 