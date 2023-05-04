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

  describe 'check_horizontal' do
    context 'when consecutive same color pieces entered 4 times horizontally' do
      before do
        game.connect_four.insert_piece(1, '🟡')
        game.connect_four.insert_piece(2, '🟡')
        game.connect_four.insert_piece(3, '🟡')
        game.connect_four.insert_piece(4, '🟡')
        game.connect_four.print_board
      end

      it 'returns true' do
        expect(game.check_horizontal).to eq(true)
      end
    end
  end
end