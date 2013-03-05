require 'spec_helper'

describe GameService do

  subject do
    GameService.new(stub(:storage => stub(:set => true),
      :game_name => "users:doug:1",
      :board => stub,
      :coordiantes => stub
    ))
  end

  it "new game" do
    subject.new_game.should == [200, {:id => "users:doug:1", :x => 1, :y => 1}]
  end

  it "fire" do
    Board.any_instance.stub(:fire => "miss")
    subject.fire.should == [200, {:id=>"users:doug:1", :x=>1, :y=>1, :status=>"miss"}]
  end
end
