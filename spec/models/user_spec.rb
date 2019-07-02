require 'rails_helper'

describe User do 
	describe "associations" do 
		it { should have_many(:work_items) }
		it { should have_many(:companies) }
	end  

	let(:alice) { Fabricate(:user) }
	let(:bob) { Fabricate(:user) }

	let!(:work_item1) { Fabricate(:work_item, user: alice) }
	let!(:work_item2) { Fabricate(:work_item, user: alice) }
	let!(:work_item3) { Fabricate(:work_item, user: bob)}

	describe "#accuracy_score" do 
		let!(:review1) { Fabricate(:review, accuracy: 68.5, work_item: work_item1) }
		let!(:review2) { Fabricate(:review, accuracy: 70.93, work_item: work_item2) }

		it "returns the average accuracy_score in 2 decimal places" do
			expect(alice.accuracy_average).to eq(69.72)
		end 

		it "returns N/A if no score" do 
			expect(bob.accuracy_average).to eq('NA')
		end 
	end 

	describe "#timeliness_average" do 
		let!(:review1) { Fabricate(:review, timeliness: 68.5, work_item: work_item1) }
		let!(:review2) { Fabricate(:review, timeliness: 70.93, work_item: work_item2) }

		it "returns the average timeliness average in 2 decimal places" do
			expect(alice.timeliness_average).to eq(69.72)
		end 

		it "returns N/A if no score" do 
			expect(bob.timeliness_average).to eq('NA')
		end 
	end 

	describe "#detail_average" do 
		let!(:review1) { Fabricate(:review, detail: 68.5, work_item: work_item1) }
		let!(:review2) { Fabricate(:review, detail: 70.93, work_item: work_item2) }

		it "returns the average detail average in 2 decimal places" do
			expect(alice.detail_average).to eq(69.72)
		end 

		it "returns N/A if no score" do 
			expect(bob.detail_average).to eq('NA')
		end 
	end 

	describe "#grammar_average" do 
		let!(:review1) { Fabricate(:review, grammar: 68.5, work_item: work_item1) }
		let!(:review2) { Fabricate(:review, grammar: 70.93, work_item: work_item2) }

		it "returns the grammar average in 2 decimal places" do
			expect(alice.grammar_average).to eq(69.72)
		end 

		it "returns N/A if no score" do 
			expect(bob.grammar_average).to eq('NA')
		end 
	end 
end







































