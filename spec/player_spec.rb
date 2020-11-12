require 'player'

describe Player do

  let(:opponent) { Player.new }

  it 'creates an instance of the Player class' do
    expect(subject).to be_instance_of(Player)
  end

  describe "#initialize" do
    it 'creates a hit_points variable upon initialisation' do
      expect(subject.hit_points).to eq(described_class::MAX_HIT_POINTS)
    end

    it 'creates a name variable' do
      expect(subject.name).to be_nil
    end
  end

  describe "#attack" do
    it 'is called on an instance of Player' do
      expect(subject).to respond_to(:attack).with(1).argument
    end
  end

  describe "#get_hit" do
    it 'is called on an instance of Player' do
      expect(subject).to respond_to(:get_hit)
    end

    it 'subtracts 1 from the hit_points' do
      expect { subject.attack(opponent) }.to change{ opponent.hit_points }.by(-10)
    end
  end
end