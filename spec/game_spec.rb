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

  describe 'player1_turn' do
    subject (:game) { described_class.new }

    context 'when column 6 is choosen' do
      before do
        allow(game).to receive(:gets).and_return('6')
        allow(game.connect_four).to receive(:puts)
        allow(game).to receive(:puts)
        game.player1_turn
      end
      it 'updates game [5][5] to 🔴' do
        expect(game.connect_four.board[5][5]).to eq('🔴')
      end
    end
  end

  describe 'player2_turn' do
    subject (:game) { described_class.new }

    context 'when column 7 is choosen' do
      before do
        allow(game).to receive(:gets).and_return('7')
        allow(game.connect_four).to receive(:puts)
        allow(game).to receive(:puts)
        game.player2_turn
      end
      it 'updates board [5][6] to 🟡' do
        expect(game.connect_four.board[5][6]).to eq('🟡')
      end
    end
  end

  describe 'row_full?' do
    subject(:game) { described_class.new }

    context 'when 1 row is full' do
      it 'returns true' do
        6.times do
          game.connect_four.insert_piece(1, 'X')
        end
        expect(game.row_full?(1)).to eq(true)
      end
    end

    context 'when row 1 is empty' do
      it 'returns false' do
        expect(game.row_full?(1)).to eq(false)
      end
    end
  end

  describe '#player_input' do
    subject(:game) { described_class.new }

    context 'when column 6 is choosen but is full' do
      before do
        allow(game).to receive(:gets).and_return('6')
        allow(game.connect_four).to receive(:puts)
        allow(game).to receive(:row_full?).and_return(true, false)
      end
      
      it 'returns "column is full, choose another!"' do
        expect{ game.player_input }.to output("column is full, choose another!\n").to_stdout
      end
    end

    context 'when column 7 is choosen and is not full' do
      before do
        allow(game).to receive(:gets).and_return('7')
        allow(game.connect_four).to receive(:puts)
        allow(game).to receive(:row_full?).and_return(false)
      end
      
      it 'returns column 7 back' do
        expect(game.player_input).to eq(7)
      end
    end
  end
end
