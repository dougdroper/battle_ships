class Coordinates
  attr_reader :x, :y
  def initialize(options={})
    @x, @y = options["x"], options["y"]
    validate
  end

  private

  def validate
    raise CoordinateMissingException.new if missing_coordinates?
    raise OutOfBoundsException.new if out_of_bounds?
  end

  def missing_coordinates?
    !!!(x && y)
  end

  def out_of_bounds?
    x < 0 || y > 100
  end
end

class OutOfBoundsException < Exception
  def error_message
    "Out of bounds"
  end
end

class CoordinateMissingException < Exception
  def error_message
    "Missing coordinate"
  end
end