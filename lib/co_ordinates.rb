class CoOrdinates
  attr_reader :x, :y
  def initialize(options={})
    @x, @y = options["x"], options["y"]
    validate
  end

  private

  def validate
    raise CoOrdinateMissingException.new if missing_co_ordinate?
    raise OutOfBoundsException.new if out_of_bounds?
  end

  def missing_co_ordinate?
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

class CoOrdinateMissingException < Exception
  def error_message
    "Missing co-ordinate"
  end
end