require 'spec_helper'

describe Coordinates do
  it "raises an out of bounds error when x is -1" do
    expect { Coordinates.new("x" => -1, "y" => 2) }.to raise_exception(OutOfBoundsException)
  end

  it "raises an out of bounds error when y is > 100" do
    expect { Coordinates.new("x" => 1, "y" => 101) }.to raise_exception(OutOfBoundsException)
  end

  it "raises an out of bounds error with missing coordinate" do
    expect { Coordinates.new("x" => 1) }.to raise_exception(CoordinateMissingException)
  end
end