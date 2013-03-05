require 'spec_helper'

describe NewGame do
  it "parses name" do
    NewGame.new(stub, {"name" => "test", "email" => ""}).name.should == "test"
  end

  it "parses email" do
    NewGame.new(stub, {"email" => "test@test.com", "name" => ""}).email.should == "test@test.com"
  end

  it "raises an error if both are missing" do
    expect { NewGame.new(stub) }.to raise_exception(NameEmailException)
  end
end