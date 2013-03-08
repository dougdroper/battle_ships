require 'spec_helper'

describe Game do
  it "parses name" do
    g = Game.new
    g.new_game({"name" => "test", "email" => ""})
    g.name.should == "test"
  end

  it "parses email" do
    g = Game.new
    g.new_game({"name" => "test", "email" => "test@test.com"})
    g.email.should == "test@test.com"
  end

  it "raises an error if both are missing" do
    expect { Game.new.new_game }.to raise_exception(NameEmailException)
  end
end