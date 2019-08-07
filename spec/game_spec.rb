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

  # testing draw
  describe "#draw?" do
    context 'when no more cells available and no winner' do
      it 'returns true' do
        game.board.update_board('X',1)
        game.board.update_board('O',3)
        game.board.update_board('X',2)
        game.board.update_board('O',4)
        game.board.update_board('X',7)
        game.board.update_board('O',5)
        game.board.update_board('X',6)
        game.board.update_board('O',8)
        game.board.update_board('X',9)
        expect( game.draw? ).to eql(true)
      end
    end
  end

  describe "#check_availability?" do
    context 'when passing a position that is not available' do
      it 'returns false' do
        game.board.update_board('X',1)
        expect( game.check_availability?(1) ).to eql(false)
      end
    end

    context 'when passing a position that is available' do
      it 'returns true' do
        expect( game.check_availability?(2) ).to eql(true)
      end
    end
  end

end