class GameService
  attr_reader :game, :storage

  def initialize(game)
    @storage = RedisStorage.new
    @game = game
  end

  def new_game
    x,y = game.next_coordiantes
    storage.set(game.id, Marshal.dump(game))
    [200, {:id => game.id, :x => x, :y => y}]
  end

  def fire
    x,y = game.next_coordiantes
    storage.set(game.id, Marshal.dump(game))
    [200, {:id=>game.id, :x=>x, :y=>y, :status=>game.status}]
  end
end