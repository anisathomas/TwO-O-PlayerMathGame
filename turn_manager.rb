class TurnManager
  def initialize(players)
    @players = players
    @number = 0
  end
  def current_player
    @players[@number]
  end

  def next_player
    @number = (@number + 1) % @players.length
  end
end

#works with any number of players