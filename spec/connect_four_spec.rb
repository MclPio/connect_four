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
  end

  describe '#play_game' do
    subject(:game) { described_class.new }

    before do
      allow(game).to receive(:gets).and_return('1')
      allow(game).to receive(:puts)
      game.play_game
    end

    context 'when it is player 1 turn' do
      it 'asks for column input for player 1' do
        expect(game.board[5][0]).to eq('🔴')
      end
    end

    context 'when it is player 2 turn' do
      it 'asks for column input for player 1' do
        expect(game.board[4][0]).to eq('🟡')
      end
    end
    #to be continued
  end
end
