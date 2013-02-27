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
end