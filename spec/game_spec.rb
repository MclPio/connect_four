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

  describe 'row_full?' do
    subject(:game) { described_class.new }

    context 'when row is full' do
      it 'returns true' do
        6.times do
          game.connect_four.insert_piece(1, 'X')
        end
        expect(game.row_full?(1)).to eq(true)
      end
    end

    context 'when row is empty' do
      it 'returns false' do
        expect(game.row_full?(1)).to eq(false)
      end
    end
  end

  describe '#player_input' do
    context 'should group actions of clean_input and row_full?' do
      xit 'will have to return valid input'
    end
  end
end
