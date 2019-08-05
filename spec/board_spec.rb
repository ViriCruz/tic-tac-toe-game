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
  
end