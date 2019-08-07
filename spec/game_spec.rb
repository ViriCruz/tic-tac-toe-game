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

      it 'returns false for O player' do
        expect( game.won?("O") ).to eql(false)
      end
    end

    context 'when O O O in diagonal' do
      it 'returns true' do
        game.board.update_board('O',3)
        game.board.update_board('O',5)
        game.board.update_board('O',7)
        expect( game.won?("O") ).to eql(true)
      end

      it 'returns false for X player' do
        expect( game.won?("X") ).to eql(false)
      end
    end

    context 'when X X X in vertical line' do
      it 'returns true' do
        game.board.update_board('X',1)
        game.board.update_board('X',4)
        game.board.update_board('X',7)
        expect( game.won?('X') ).to eql(true)
      end

      it 'returns false' do
        expect( game.won?("O") ).to eql(false)
      end
    end
  end

  
end