require 'spec_helper'

describe Board do
  it "returns a new fleet" do
    Board.new.fleet.length.should == 17
  end

  it "returns a fleet passed into it" do
    Board.new([""]).fleet.should == [""]
  end

  it "returns the status of the coordinate" do
    Fleet.any_instance.stub(:position_fleet).and_return([[[0,0]]])
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1)).should == "miss"
  end

  it "doesn't add a coordinate to the board in the same position" do
    Fleet.any_instance.stub(:position_fleet).and_return([[[1,1]]])
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1)).should == "hit"
  end

  it "places a ship down" do
    Fleet.any_instance.stub(:position_fleet).and_return([[[0,0], [0,1], [0,2]]])
    board = Board.new
    board.fleet.should == {"00" => "s", "01" => "s", "02" => "s"}
  end
end
