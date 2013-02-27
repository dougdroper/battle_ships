require 'spec_helper'

describe CoOrdinates do
  it "raises an out of bounds error when x is -1" do
    expect { CoOrdinates.new("x" => -1, "y" => 2) }.to raise_exception(OutOfBoundsException)
  end

  it "raises an out of bounds error when y is > 100" do
    expect { CoOrdinates.new("x" => 1, "y" => 101) }.to raise_exception(OutOfBoundsException)
  end

  it "raises an out of bounds error with missing co-ordinate" do
    expect { CoOrdinates.new("x" => 1) }.to raise_exception(CoOrdinateMissingException)
  end
end