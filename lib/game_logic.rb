class GameLogic
  attr_reader :board
  def initialize(board=[])
    @board = board
  end

  def xy
    return if @board.length == 100
    try = [random_number, random_number].join("")
    board.include?(try) ? xy : add_to_board(try)
  end

  private

  def add_to_board(try)
    board << try
    try
  end

  def random_number
    rand(10)
  end
end