class Game
  attr_reader :player_1, :player_2, :current_player, :opponent, :last_action
  def initialize(p1, p2)
    @player_1 = p1
    @player_2 = p2
    @players = [@player_1, @player_2]
    @current_player = @player_1
    @opponent = @player_2
    @last_action = 'Game started!'
  end

  def attack(player)
    player.receive_damage
    update_last_action(@current_player, 'attacked', @opponent)
  end

  def loser
    @players.select { |p| p.hp == 0 }.pop
  end

  def update_last_action(player, action, opponent)
    @last_action = "#{player.name} #{action} #{opponent.name}"
  end

  def switch_turn
    @opponent = @players.select { |p| p == @current_player }.pop
    @current_player = @players.select { |p| p != @current_player }.pop
  end
end
