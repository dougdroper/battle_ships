require 'spec_helper'

describe Board do
  it "returns a new board" do
    Board.new.board.should == [""] * 100
  end

  it "returns a board passed into it" do
    Board.new([""]).board.should == [""]
  end

  it "add a co-ordinate to the board" do
    board = Board.new
    board.fire(CoOrdinates.new("x" => 1, "y" => 1))
    board.board.take(12).should == [""] * 11 + ["x"]
  end
end
