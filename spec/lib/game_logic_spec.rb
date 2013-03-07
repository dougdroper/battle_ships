require 'spec_helper'

describe GameLogic do
  it "has x and y that has not been visited before" do
    GameLogic.any_instance.stub(:random_number).and_return(0,0,1,1)
    GameLogic.new(["00"], {"00" => ""}).xy.should == ["1","1"]
  end

  it "marks the opponents coordinates as hit" do
    GameLogic.any_instance.stub(:random_number).and_return(0,0,1,1)
    GameLogic.new([0,0], ["00"]).places_visited.should == {"00" => :h}
  end

  it "keeps going until the places_visited is full" do
    game = GameLogic.new
    101.times { game.xy }
    game.places_visited.map {|e| e.split("")}.flatten.select {|e| e.to_i == 0}.length.should == 20
    game.places_visited.length.should == 100
  end
end