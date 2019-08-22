require 'game'

describe Game do
  let(:player_1) { double(:player_1, name: 'Player 1', hp: 200) }
  let(:player_2) { double(:player_2, name: 'Player 2', hp: 200) }
  subject(:subject) { described_class.new(player_1, player_2) }

  it 'initializes with 2 players' do
    expect(subject.player_1).to_not be_nil
    expect(subject.player_2).to_not be_nil
  end
  it 'can attack a player, decreasing HP by 10' do
    expect(player_2).to receive(:receive_damage).and_return(190)
    subject.attack(player_2)
  end
end
