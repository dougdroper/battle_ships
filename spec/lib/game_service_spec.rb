require 'spec_helper'

describe GameService do

  subject do
    GameService.new(stub(:next_coordiantes => [1,1], :id => 1, :status => "miss"))
  end

  it "new game" do
    RedisStorage.stub(:new => stub(:set => true))
    subject.new_game.should == [200, {:id => 1, :x => 1, :y => 1}]
  end

  it "fire" do
    RedisStorage.stub(:new => stub(:set => true))
    Board.any_instance.stub(:fire => "miss")
    subject.fire.should == [200, {:id=>1, :x=>1, :y=>1, :status=>"miss"}]
  end
end
