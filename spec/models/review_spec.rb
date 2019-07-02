require 'rails_helper'

describe Review do 
	describe "associations" do 
		it { should belong_to :work_item }
		it { should validate_uniqueness_of :work_item_id }
		it { should validate_presence_of :accuracy }
		it { should validate_presence_of :timeliness }
		it { should validate_presence_of :grammar }
		it { should validate_presence_of :detail }
		it { should validate_presence_of :comment }
	end 
end 