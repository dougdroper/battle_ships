require 'spec_helper'

describe Fleet do
  it "have five ships" do
    Fleet.new.fleet.map(&:length).should == [5,4,3,3,2]
  end

  it "position five ships" do
    Fleet.new.position.should == [5,4,3,3,2]
  end
end