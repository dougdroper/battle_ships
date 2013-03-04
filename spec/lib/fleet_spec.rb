require 'spec_helper'

describe Fleet do
  it "have five ships" do
    Fleet.new.fleet.map(&:length).should == [5,4,3,3,2]
  end

  it "position the first ship" do
    ship = stub(:x => 1, :y => 7, :length => 5, :direction => :across)
    Fleet.new([ship]).position_fleet.should == [[[1, 7], [2, 7], [3, 7], [4, 7], [5, 7]]]
  end

  it "position the second ship" do
    ship = stub(:x => 1, :y => 7, :length => 5, :direction => :across)
    ship2 = stub(:x => 2, :y => 8, :length => 4, :direction => :across)
    Fleet.new([ship, ship2]).position_fleet.should ==  [[[1, 7], [2, 7], [3, 7], [4, 7], [5, 7]], [[2, 8], [3, 8], [4, 8], [5, 8]]]
  end

  it "position redoes the position when it is not valid" do
    ship = stub(:x => 1, :y => 1, :length => 3, :direction => :across)
    ship2 = stub(:x => 1, :length => 3, :direction => :across)
    ship2.stub(:y).and_return(1,2)
    Fleet.new([ship, ship2]).position_fleet.should ==  [[[1,1], [2,1], [3,1]], [[1,2], [2,2], [3,2]]]
  end

  it "position redoes the position when it is not valid when down" do
    ship = stub(:x => 1, :y => 1, :length => 3, :direction => :down)
    ship2 = stub(:x => 1, :length => 3, :direction => :across)
    ship2.stub(:y).and_return(1,7)
    Fleet.new([ship, ship2]).position_fleet.should ==  [[[1,1], [1,2], [1,3]], [[1,7], [2,7], [3,7]]]
  end

  it "position redoes the position when it is not valid when down" do
    Fleet.new.position_fleet.length.should ==  5
  end
end