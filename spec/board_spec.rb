require_relative '../lib/board'

describe Board do
# -----------
# |1| |X| |3| 
# -----------
# |4| |5| |6| 
# -----------
# |7| |8| |9| 
# -----------
  
  let!(:board) { Board.new }
  # testing update_board, trigger won? if someone won the match
  describe "#update_board" do
    context 'when update value in grid' do
      it do
        expect { board.update_board('X', 2) }.to output("-----------\n|1| |X| |3| \n-----------\n|4| |5| |6| \n-----------\n|7| |8| |9| \n-----------\n").to_stdout
      end
      it do
        expect { board.update_board(12, 1) }.to output("-----------\n|12| |2| |3| \n-----------\n|4| |5| |6| \n-----------\n|7| |8| |9| \n-----------\n").to_stdout
      end 
    end

    # edge case
    context 'when passing an index out of bounds' do
      it 'raises a TypeError' do
        expect { board.update_board(12, 12) }.to raise_error(TypeError)
      end
    end
  end

  describe "#find_row" do
    context 'when passing a number from 1 to 3 inclusive' do
      it 'returns the row index 0' do
        expect( board.find_row(1) ).to eql(0)
      end
      it 'returns the row index 0' do
        expect( board.find_row(2) ).to eql(0)
      end
      it 'returns the row index 0' do
        expect( board.find_row(3) ).to eql(0)
      end
      
      it 'must not return 1 or any other number higher than 2' do
        expect( board.find_row(1) ).not_to eql(1)
        expect( board.find_row(1) ).not_to eql(5)
      end
    end

    context 'when passing a number from 4 to 6 inclusive' do
      it 'returns the row index 1' do
        expect( board.find_row(4) ).to eql(1)
      end
      it 'returns the row index 1' do
        expect( board.find_row(5) ).to eql(1)
      end
      it 'returns the row index 1' do
        expect( board.find_row(6) ).to eql(1)
      end

      it 'must not return 0, 2 or any other number higher than 2' do
        expect( board.find_row(4) ).not_to eql(0)
        expect( board.find_row(4) ).not_to eql(2)
        expect( board.find_row(6) ).not_to eql(7)
      end
    end

    context 'when passing a number from 7 to 9 inclusive' do
      it 'returns the row index 2' do
        expect( board.find_row(7) ).to eql(2)
      end
      it 'returns the row index 2' do
        expect( board.find_row(8) ).to eql(2)
      end
      it 'returns the row index 2' do
        expect( board.find_row(9) ).to eql(2)
      end

      it 'must not return 0, 1 or any other number higher than 2' do
        expect( board.find_row(7) ).not_to eql(0)
        expect( board.find_row(7) ).not_to eql(1)
        expect( board.find_row(8) ).not_to eql(10)
      end
    end

    context 'when passing a string' do
      it 'returns nil' do
        expect( board.find_row("a") ).to eql(nil)
      end

      it 'must not return 2' do
        expect( board.find_row("9") ).not_to eql(2)
      end
    end
  end
  
  describe "#find_col" do
    context 'when passing a number 1, 4 or 7' do
      it 'returns the column index 0' do
        expect( board.find_col(1) ).to eql(0)
        expect( board.find_col(4) ).to eql(0)
        expect( board.find_col(7) ).to eql(0)
      end
    end

    context 'when passing a number 2, 5 or 8' do
      it 'returns the column index 1' do
        expect( board.find_col(2) ).to eql(1)
        expect( board.find_col(5) ).to eql(1)
        expect( board.find_col(8) ).to eql(1)
      end
    end

    context 'when passing a number 3, 6 or 9' do
      it 'returns the column index 2' do
        expect( board.find_col(3) ).to eql(2)
        expect( board.find_col(6) ).to eql(2)
        expect( board.find_col(9) ).to eql(2)
      end
    end
  end
end