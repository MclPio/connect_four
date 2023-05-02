require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    context 'when red player created' do
      subject(:gamer) { described_class.new('red') }

      it 'creates player color red' do
        color = gamer.instance_variable_get(:@color)
        expect(color).to eq('🔴')
      end
    end

    context 'when yellow player created' do
      subject(:gamer) { described_class.new('yellow') }

      it 'creates player color yellow' do
        color = gamer.instance_variable_get(:@color)
        expect(color).to eq('🟡')
      end
    end
  end
end
