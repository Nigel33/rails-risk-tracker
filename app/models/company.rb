class Company < ActiveRecord::Base
	has_many :work_items
	has_many :users, through: :work_items
	belongs_to :niche
	validates_presence_of :name, :address, :niche
	validates :name, uniqueness: true
end 