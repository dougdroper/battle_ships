require 'spec_helper'

describe GameLogic do
  it "has xy that is not in the board" do
    GameLogic.any_instance.stub(:random_number).and_return(0,0,1,1)
    GameLogic.new(["00"]).xy.should == "11"
  end

  it "keeps going until the board is full" do
    game = GameLogic.new
    101.times { game.xy }
    game.board.map {|e| e.split("")}.flatten.select {|e| e.to_i == 0}.length.should == 20
    game.board.length.should == 100
  end
end