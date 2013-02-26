require 'spec_helper'

describe Game do
  subject { Game.new(stub(:incr => 1)) }

  it "is created with a name and email" do
    subject.new_game({"name" => "Doug", "email" => "doug@gmail.com"}).should == [200, {:id => "users:doug:1", :x => 1, :y => 1}]
  end
end