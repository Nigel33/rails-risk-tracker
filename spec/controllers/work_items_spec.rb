require 'rails_helper'

describe WorkItemsController do 
  describe "#update", js: true do 
    let(:work_item) { Fabricate(:work_item) }
    before(:each) { set_current_user }

    it_behaves_like "require_sign_in" do 
      let(:action) { put :update, params: {id: work_item.id} }
    end 

    context "mark item as complete" do 
      before(:each) do 
        put :update, params: {id: work_item.id, complete: 'true'}, format: 'js'
      end 

      it "redirects to another page" do 
        expect(response.code).to eq('302')
      end 

      it "creates flash notice" do 
        expect(flash[:notice]).to be_present
      end 

      it "marks the work item as completed" do 
        expect(work_item.reload.completed).to eq(true)
      end 
    end 
    

  end 
end 