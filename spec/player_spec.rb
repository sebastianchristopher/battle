require 'player'

describe Player do
  subject(:subject) { described_class.new("Player 1", 100) }
  it 'has a name' do
    expect(subject.name).to eq("Player 1")
  end
  it 'has HP' do
    expect(subject.hp).to eq(100)
  end
end
