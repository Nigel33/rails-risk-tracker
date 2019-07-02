require 'rails_helper'

describe Serializer do 
	let(:niche) { Fabricate(:niche)}
	let(:company) { Fabricate(:company, niche: niche) }

	describe "serialize" do 
		before(:each) { @obj = Serializer.new(company).serialize }

		it "returns a hash of attributes" do 
			expect(@obj.class).to eq(Hash)
		end 

		it "gets the niche name of the company" do 
			expect(@obj['niche']).to eq(niche.name)
		end 
	end 
end 