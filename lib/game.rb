class Game
  attr_reader :player_1, :player_2, :current_player, :opponent
  def initialize(p1, p2)
    @player_1 = p1
    @player_2 = p2
    @players = [@player_1, @player_2]
    @current_player = @player_1
    @opponent = @player_2
  end

  def attack(player)
    player.receive_damage
  end

  def loser
    @players.select { |p| p.hp == 0 }.pop
  end

  def switch_turn
    @opponent = @players.select { |p| p == @current_player }.pop
    @current_player = @players.select { |p| p != @current_player }.pop
  end
end
