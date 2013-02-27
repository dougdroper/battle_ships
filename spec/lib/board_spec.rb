require 'spec_helper'

describe Board do
  it "returns a new board" do
    Board.new.board.should == [""] * 100
  end
end