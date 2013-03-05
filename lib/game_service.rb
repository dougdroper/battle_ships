class GameService
  attr_reader :game, :storage

  def initialize(game)
    @game = game
    @storage = game.storage
  end

  def new_game
    storage.set(game.game_name, Board.new.board, [])
    [200, {:id => game.game_name, :x => 1, :y => 1}]
  end

  def fire
    status = Board.new(game.board).fire(game.coordiantes)
    [200, {:id=>game.id, :x=>1, :y=>1, :status=>status}]
  end
end