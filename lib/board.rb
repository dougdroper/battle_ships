require 'coordinates'

class Board
  attr_reader :board
  def initialize(board=nil)
    @board = board || new_board
  end

  def status
    "miss"
  end

  def new_board
    [""] * 100
  end

  def fire(coordinates)
    raise AlreadyTaken if board[coordinates.x + (coordinates.y * 10)] == "x"
    board[coordinates.x + (coordinates.y * 10)] = "x"
  end
end

class AlreadyTaken < Exception
  def error_message
    "Coordinate already taken"
  end
end