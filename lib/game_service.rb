class GameService
  attr_reader :game, :storage

  def initialize(game)
    @game = game
    @storage = game.storage
  end

  def new_game(logic=GameLogic.new(game))
    x,y = logic.xy
    storage.set(game.game_name, Board.new.fleet.merge("visited" => logic.places_visited))
    [200, {:id => game.game_name, :x => x, :y => y}]
  end

  def fire(logic=GameLogic.new(game))
    debugger
    logic.update_status_of_opponent(game.status)
    x,y = logic.xy
    status = Board.new(game.fleet).fire(game.coordiantes)
    storage.set(game.id, game.fleet.merge("visited" => logic.places_visited))
    [200, {:id=>game.id, :x=>x, :y=>y, :status=>status}]
  end
end