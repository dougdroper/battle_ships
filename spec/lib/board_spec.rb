require 'spec_helper'

describe Board do
  it "returns a new board" do
    Board.new.board.should == [""] * 100
  end

  it "returns a board passed into it" do
    Board.new([""]).board.should == [""]
  end

  it "add a coordinate to the board" do
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1))
    board.board.take(12).should == [""] * 11 + ["x"]
  end

  it "doesn't add a coordinate to the board in the same position" do
    board = Board.new
    board.fire(Coordinates.new("x" => 1, "y" => 1))
    board.board.take(12).should == [""] * 11 + ["x"]
    expect {board.fire(Coordinates.new("x" => 1, "y" => 1))}.to raise_exception(AlreadyTaken)
  end
end
