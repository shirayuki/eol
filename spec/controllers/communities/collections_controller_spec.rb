require File.dirname(__FILE__) + '/../../spec_helper'

def do_index
  get :index, :community_id => @collections[:community].id.to_i
end

describe Communities::CollectionsController do

  before(:all) do
    truncate_all_tables
    load_scenario_with_caching :collections
    @collections = EOL::TestInfo.load('collections')
  end

  describe 'GET index' do

    it "should instantiate the community" do
      do_index
      assigns[:community].should be_a(Community)
      assigns[:community].id.should == @collections[:community].id
    end

    it "should load a community's focus collection" do
      do_index
      assigns[:community].focus.should be_a(Collection)
    end

    it "should load a community's endorsed collections"
  end

end
