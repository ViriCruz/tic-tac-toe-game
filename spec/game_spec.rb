require_relative '../lib/game'

describe Game do
  let!(:game) { Game.new }
  describe "#won?" do
    context 'when X X X across the top row' do
      it 'returns true' do
        game.board.update_board('X',1)
        game.board.update_board('X',2)
        game.board.update_board('X',3)
        expect( game.won?("X") ).to eql(true)
      end
    end
  end
end