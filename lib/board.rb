# frozen_string_literal: true

# Board class to handle the grid, update it and to display it.
class Board
  attr_reader :grid
  # initialize a board of 3x3
  def initialize
    @grid = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  # display the board in a friendly manner for the user
  def display_board
    count = 1
    @grid.each do |row|
      row.each do |cell|
        puts '-' * 11 if count == 1
        print "|#{cell}| "
        puts "\n", '-' * 11 if (count % 3).zero?
        count += 1
      end
    end
  end

  # update the board when players moves and display the new board
  def update_board(player_option, position)
    row = find_row(position)
    col = find_col(position)
    grid[row][col] = player_option
    puts 'Game updated!'
    display_board
  end

  def find_row(position)
    row = nil
    case position
    when 1..3
      row = 0
    when 4..6
      row = 1
    when 7..9
      row = 2
    end

    row
  end

  def find_col(position)
    col = nil
    case position
    when 1, 4, 7
      col = 0
    when 2, 5, 8
      col = 1
    when 3, 6, 9
      col = 2
    end
    col
  end
end
