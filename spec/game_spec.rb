require_relative '../lib/game'

describe Game do
  describe '#play_game' do
    context 'when pick color' do
    end
  end

  describe '#clean_input' do
    subject(:game) { described_class.new }

    context 'when input is valid' do
      it 'returns 1' do
        allow(game).to receive(:gets).and_return('1')
        expect(game.clean_input).to eq(1)
      end

      it 'returns 7' do
        allow(game).to receive(:gets).and_return('7')
        expect(game.clean_input).to eq(7)
      end
    end
  end
end
