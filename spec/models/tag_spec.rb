require 'spec_helper'

describe Tag do
  it "should be able to associate bid items with itself" do
    tag = Factory.create(:tag)
    initial_count = tag.bid_items.count
    
    tag.add_bid_item(Factory.create(:bid_item))
    
    tag.bid_items.count.should == initial_count + 1
  end
end