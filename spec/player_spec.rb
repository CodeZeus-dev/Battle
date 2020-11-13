require 'player'

describe Player do

  subject(:player) { Player.new("Constantine") }
  let(:opponent) { Player.new("Alex") }
  let(:game) { Game.new(player, opponent) }

  it 'creates an instance of the Player class' do
    expect(player).to be_instance_of(Player)
  end

  describe "#initialize" do
    it 'creates a hit_points variable upon initialisation' do
      expect(player.hit_points).to eq(described_class::MAX_HIT_POINTS)
    end

    it 'creates a name variable' do
      expect(player.name).to eq("Constantine")
    end
  end

  describe "#get_hit" do
    it 'is called on an instance of Player' do
      expect(player).to respond_to(:get_hit)
    end

    it 'subtracts 1 from the hit_points' do
      expect { game.attack(opponent) }.to change{ opponent.hit_points }.by(-10)
    end
  end
end