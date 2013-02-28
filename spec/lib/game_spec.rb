require 'spec_helper'

describe Game do

  subject do
    Game.new(stub(:incr => 1, :get => stub, :set => true))
  end

  it "is created with a name and email" do
    subject.new_game({"name" => "Doug", "email" => "doug@gmail.com"}).should == [200, {:id => "users:doug:1", :x => 1, :y => 1}]
  end

  it "is not created without a name or email" do
    subject.new_game({"email" => "doug@gmail.com"}).should == [500, {:error=>"name/email is required"}]
  end

  it "receives a fire even with coordinates and returns a miss" do
    Board.any_instance.stub(:status => "miss", :board => ([""] * 100))
    game = Game.new(stub(:incr => 1, :get => stub))
    game.fire({"id" => "users:doug:1", "x" => 1, "y" => 1}).should == [200, {:id => "users:doug:1", :x => 1, :y => 1, :status => "miss"}]
  end

  it "receives a fire even with coordinates and returns a hit" do
    Board.any_instance.stub(:status => "hit", :board => ([""] * 100))
    game = Game.new(stub(:incr => 1, :get => stub))
    game.fire({"id" => "users:doug:1", "x" => 1, "y" => 1}).should == [200, {:id => "users:doug:1", :x => 1, :y => 1, :status => "hit"}]
  end
end