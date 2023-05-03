# frozen_string_literal: true

require_relative '../lib/connect_four'

describe ConnectFour do
  describe '#initialize' do
    subject(:game) { described_class.new }
    it 'creates board array' do
      board = game.instance_variable_get(:@board)
      expect(board).to eq([["  ", "  ", "  ", "  ", "  ", "  ", "  "],
        ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
        ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
        ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
        ["  ", "  ", "  ", "  ", "  ", "  ", "  "],
        ["  ", "  ", "  ", "  ", "  ", "  ", "  "]]
       )
    end
  end

  describe '#print_board' do
    subject(:game) { described_class.new }

    it 'outputs to the command line' do
      expect{ game.print_board }.to output.to_stdout
    end
  end

  describe '#insert_piece' do
    subject(:game) { described_class.new }

    context 'when piece is inserted into column 1' do
      before do
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
      end
      it 'falls to row 1' do
        expect(game.board[5][0]).to eq('🔴')
      end

      it 'falls to row 2' do
        expect(game.board[4][0]).to eq('🟡')
      end

      it 'falls to row 3' do
        expect(game.board[3][0]).to eq('🔴')
      end

      it 'falls to row 4' do
        expect(game.board[2][0]).to eq('🟡')
      end

      it 'falls to row 5' do
        expect(game.board[1][0]).to eq('🔴')
      end

      it 'falls to row 6' do
        expect(game.board[0][0]).to eq('🟡')
      end
    end

    context 'when piece is inserted into multiple columns' do
      before do
        game.insert_piece(2, '🔴')
        game.insert_piece(3, '🟡')
        game.insert_piece(4, '🔴')
        game.insert_piece(5, '🟡')
        game.insert_piece(6, '🔴')
        game.insert_piece(6, '🟡')
      end
      it 'falls to row 1 column 2' do
        expect(game.board[5][1]).to eq('🔴')
      end

      it 'falls to row 1 column 3' do
        expect(game.board[5][2]).to eq('🟡')
      end

      it 'falls to row 1 column 4' do
        expect(game.board[5][3]).to eq('🔴')
      end

      it 'falls to row 1 column 5' do
        expect(game.board[5][4]).to eq('🟡')
      end

      it 'falls to row 1 column 6' do
        expect(game.board[5][5]).to eq('🔴')
      end

      it 'falls to row 2 column 6' do
        expect(game.board[4][5]).to eq('🟡')
      end
    end

    context 'when piece is inserted to column 2' do
      subject(:board) {described_class.new}

      before do
        board.insert_piece(2, '🔴')
      end

      it 'gets the last entry as "[5] [1]"' do
        expect(board.last_entry).to eq('[5] [1]')
      end
    end

    context 'when piece is inserted to column 2 again' do
      subject(:board) {described_class.new}

      before do
        board.insert_piece(2, '🔴')
        board.insert_piece(2, '🟡')
      end

      it 'gets the last entry as "[4] [1]"' do
        expect(board.last_entry).to eq('[4] [1]')
      end
    end
# questionable test
    context 'when column 1 is maxed' do
      before do
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
        game.insert_piece(1, '🔴')
        game.insert_piece(1, '🟡')
      end

      xit 'returns "column is full"' do
        insert_full = game.insert_piece(1, '🔴')
        game.print_board
        expect(insert_full).to eq("column is full")
      end
    end
  end
end
