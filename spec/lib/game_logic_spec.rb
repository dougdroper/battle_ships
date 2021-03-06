require 'spec_helper'

describe GameLogic do
  before do
    @game = stub(:opponent_coordiantes => [0,0], :status => "hit", :fleet => {"00" => ''})
  end

  it "has x and y that has not been visited before" do
    GameLogic.any_instance.stub(:random_number).and_return(0,0,1,1)
    GameLogic.new(@game).xy.should == ["1","1"]
  end

  it "marks the opponents coordinates as hit" do
    g = GameLogic.new(@game)
    g.update_status_of_opponent("hit")
    g.places_visited.should == {"00" => "hit"}
  end

  it "keeps going until the places_visited is full" do
    game = GameLogic.new(@game)
    101.times { game.xy }
    game.places_visited.keys.map {|e| e.split("")}.flatten.select {|e| e.to_i == 0}.length.should == 20
    game.places_visited.keys.length.should == 100
  end
end