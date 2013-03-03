require 'spec_helper'

describe Fleet do
  it "have five ships" do
    Fleet.new.fleet.map(&:length).should == [5,4,3,3,2]
  end

  it "position five ships" do
    Fleet.new.position.should == [5,4,3,3,2]
  end
end

describe Ship do
  it "places the ship on a available positions" do
    Ship.new(5).position([(0...5), (0...1)]).should == [0,0]
  end

  it "places the ship on a available positions" do
    Ship.new(5).position([(1...6), (0...1)]).should == [1,0]
  end
end