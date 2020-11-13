require 'game'

describe Game do

  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  it 'returns an instance of the game class' do
    expect(game).to be_instance_of(described_class)
  end

  describe "#initialize" do
    it 'creates two instance variables, one for each player' do
      expect(game.player1).to eq(player_1)
      expect(game.player2).to eq(player_2)
    end
  end

  describe "#attack" do
    it 'is called on an instance of the Game class' do
      expect(game).to respond_to(:attack).with(1).argument
    end

    it 'attacks a player instance and causes damage' do
      allow(player_2).to receive(:get_hit).and_return(90)
      expect(game.attack(player_2)).to eq(90)
    end
  end

end