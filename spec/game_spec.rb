require 'game'

describe Game do
  it 'returns an instance of the game class' do
    expect(subject).to be_instance_of(described_class)
  end
end