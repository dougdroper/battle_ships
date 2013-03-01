require 'coordinates'

class Board
  attr_reader :board
  def initialize(board=nil)
    @board = board || create_fleet
  end

  def status
    "miss"
  end

  def fire(coordinates)
    raise AlreadyTaken if board[coordinates.x + (coordinates.y)] == "x"
    board[coordinates.x + (coordinates.y)] = "x"
  end

  private

  def create_fleet
    place_ship(aircraft_carrier).inject({}) do |hsh, e|
      hsh[e.join("")] = :ship
      hsh
    end
  end

  def aircraft_carrier
    [0, 0, 5, direction]
  end

  def battleship
    [0, 0, 5, direction]
  end

  def direction
    :down
  end

  def place_ship(ship)
    x, y, length, direction = ship
    dx, dy = direction == :across ? [1, 0] : [0, 1]
    (0 ... length).map{ |i| [x + i * dx, y + i * dy] }
  end
end

class AlreadyTaken < Exception
  def error_message
    "Coordinate already taken"
  end
end