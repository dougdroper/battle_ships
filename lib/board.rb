require 'co_ordinates'

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

  def fire(co_ordinates)
    board[co_ordinates.x + (co_ordinates.y * 10)] = "x"
  end
end

