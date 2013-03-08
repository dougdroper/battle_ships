class Board
  attr_reader :fleet
  def initialize(fleet=nil)
    @fleet = fleet || create_fleet
  end

  def fire(coordinates)
    raise AlreadyTaken if fleet[coordinates.x + (coordinates.y)] == "x"
    fleet[[coordinates.x, coordinates.y].join("")] == "s" ? "hit" : "miss"
  end

  private

  def create_fleet
    Fleet.new.position_fleet.inject({}) do |hsh, ships|
      ships.each do |ship|
        hsh[ship.join("")] = "s"
      end
      hsh
    end
  end
end

class AlreadyTaken < Exception
  def error_message
    "Coordinate already taken"
  end
end