class Board
  attr_accessor :board
  # initialize a board of 3x3
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  # return the board as array to make further validations of the game
  def get_board
    @board
  end

  # display the board in a friendly manner for the user
  def display_board
    count = 1
    @board.each do |row|
      row.each do |cell|
        puts "-"*11 if count  == 1
        print "|#{cell}| "
        puts "\n", "-"*11 if count % 3 == 0
        count += 1
      end
    end
  end

  # update the board when players moves and display the new board
  def update_board(player_option, position)
    row = nil
    case position 
      when 1..3
        row = 0
      when 4..6
        row = 1
      when 7..9 
        row = 3
    end
    @board[row][position - 1] = player_option
    puts "Game updated!"
    display_board
  end
end

board = Board.new
board.display_board
board.update_board("X", 3)
print board.get_board