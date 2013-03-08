require 'spec_helper'

describe GameService do

  subject do
    GameService.new(stub(:storage => stub(:set => true),
      :game_name => "users:doug:1",
      :fleet => stub,
      :coordiantes => stub,
      :id => "users:doug:1"
    ))
  end

  it "new game" do
    subject.new_game(stub(:xy => [1,1], :places_visited => [])).should == [200, {:id => "users:doug:1", :x => 1, :y => 1}]
  end

  it "fire" do
    Board.any_instance.stub(:fire => "miss")
    subject.fire(stub(:xy => [1,1], :places_visited => [], :status => "miss")).should == [200, {:id=>"users:doug:1", :x=>1, :y=>1, :status=>"miss"}]
  end
end
