require_relative '../lib/game'

describe ConnectFourChecker do
  subject (:game) { Game.new }

  describe '#check_horizontal' do
    context 'when horizontal win exists' do
      before do
        #construct horizontal win
        game.connect_four.insert_piece(1, '🔴')
        game.connect_four.insert_piece(2, '🔴')
        game.connect_four.insert_piece(3, '🔴')
        game.connect_four.insert_piece(4, '🔴')
        p game.connect_four.last_entry
        game.connect_four.print_board
      end

      it 'returns true' do
        expect(game.check_horizontal(game.connect_four.last_entry)).to eq(true)
      end
    end
  end
end