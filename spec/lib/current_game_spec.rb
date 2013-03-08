require 'spec_helper'

describe CurrentGame do
  subject { CurrentGame }

  before do
    @params = {"id" => "", "x" => 1, "y" => 1}
  end

  it "raises when no game is found" do
    expect { subject.new(@params) }.to raise_exception
  end

  it "raises an error when no game is found" do
    storage = stub(:get => nil)
    expect { subject.new(@params).board }.to raise_exception(NoGameException)
  end

  it "raises an error when no id is provided" do
    storage = stub(:get => nil)
    expect { subject.new(@params).board }.to raise_exception(NoGameException)
  end
end