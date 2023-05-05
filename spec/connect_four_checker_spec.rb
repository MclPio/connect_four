require_relative '../lib/game'

describe ConnectFourChecker do
  subject (:game) { Game.new }

  describe '#last_row' do
    context 'when last entry is column 3' do
      before do
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🔴')
      end

      it 'returns row 5' do
        expect(game.last_row(game.connect_four.last_entry)).to eq(5)
      end
    end
  end

  describe '#last_column' do
    context 'when last entry is column 3' do
      before do
        #construct horizontal win
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🔴')
      end

      it 'returns (column - 1) = 2' do
        expect(game.last_column(game.connect_four.last_entry)).to eq(2)
      end
    end
  end

  describe '#check_horizontal' do
    context 'when consecutive same color pieces entered 4 times horizontally' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(4, '🟡')
      end

      it 'returns true' do
        expect(game.check_horizontal).to eq(true)
      end
    end

    context 'when 4 pieces entered but not consecutive' do
      before do
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(7, '🟡')
      end

      it 'returns false' do
        expect(game.check_horizontal).to eq(false)
      end
    end

    context 'when 4 pieces entered consecutive but different colors' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🟡')
      end

      it 'returns false' do
        expect(game.check_horizontal).to eq(false)
      end
    end

    context 'when bottom is full different colors and 4 red consecutive' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(7, '🔴')
      end

      it 'returns true' do
        expect(game.check_horizontal).to eq(true)
      end
    end
  end

  describe '#check_vertical' do
    context 'when consecutive same color pieces entered 4 times vertically' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
      end

      it 'returns true' do
        expect(game.check_vertical).to eq(true)
      end
    end

    context 'when consecutive same color pieces entered 4 times vertically near top' do
      before do
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
      end

      it 'returns true' do
        expect(game.check_vertical).to eq(true)
      end
    end

    context 'when different color and column full' do
      before do
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
      end

      it 'returns false' do
        expect(game.check_vertical).to eq(false)
      end
    end
  end

  describe '#check_diagonal_right' do
    context 'when consecutive same color pieces entered 4 times diagonal-right' do
      before do
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(4, '🟡')
      end

      it 'returns true' do
        expect(game.check_diagonal_right).to eq(true)
      end
    end

    context 'when consecutive same color pieces entered 4 times diagonal-right from bottom left edge' do
      before do
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(4, '🔴')
      end

      it 'returns true' do
        expect(game.check_diagonal_right).to eq(true)
      end
    end

    context 'when consecutive same color pieces entered 4 times diagonal-right top right edge' do
      before do
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🟡')
      end

      it 'returns true' do
        expect(game.check_diagonal_right).to eq(true)
      end
    end

    context 'when different color pieces entered 4 times diagonal-right' do
      before do
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🟡')
      end

      it 'returns false' do
        expect(game.check_diagonal_right).to eq(false)
      end
    end
  end

  describe '#check_diagonal_left' do
    context 'when consecutive same color pieces entered 4 times diagonal-left' do
      before do
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🟡')
      end

      it 'returns true' do
        expect(game.check_diagonal_left).to eq(true)
      end
    end

    context 'when consecutive different color pieces entered 4 times diagonal-left' do
      before do
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🟡')
      end

      it 'returns false' do
        expect(game.check_diagonal_left).to eq(false)
      end
    end
  end

  describe '#draw' do
    context 'when all slots are filled' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
      end

      it 'returns true' do
        expect(game.draw).to eq(true)
      end
    end

    context 'when all slots are filled but 1' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(5, '🔴')
        game.connect_four.insert_piece(5, '🟡')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🔴')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(6, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🟡')
        game.connect_four.insert_piece(7, '🔴')
        game.connect_four.insert_piece(7, '🔴')
      end

      it 'returns false' do
        expect(game.draw).to eq(false)
      end
    end
  end
end