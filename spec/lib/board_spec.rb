require 'spec_helper'

describe Board do
  it "returns a new board" do
    Board.new.board.length.should == 100
  end

  it "returns a board passed into it" do
    Board.new([""]).board.should == [""]
  end

  it "add a coordinate to the board" do
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1))
    board.board.take(12).last.should == "x"
  end

  it "doesn't add a coordinate to the board in the same position" do
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1))
    board.board.take(12).last.should == "x"
    expect {board.fire(Coordinates.new("x" => 1, "y" => 1))}.to raise_exception(AlreadyTaken)
  end

  it "places a ship down" do
    board = Board.new
    board.board.should == {"00" => :ship, "01" => :ship, "02" => :ship, "03" => :ship, "04" => :ship}
  end
end
