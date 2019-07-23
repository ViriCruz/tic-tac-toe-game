require_relative 'board'
require_relative 'player'

# frozen_string_literal: true

# game class that will handle who is the winner or if it's a draw
class Game
  attr_reader :board, :player_one, :player_two
  attr_writer :moves
  def initialize
    @board = Board.new
    @player_one = Player.new('Player X', 'X')
    @player_two = Player.new('Player O', 'O')
  end

  def won?(player_option)
    grid = @board.grid
    player_option.upcase!
    won = false
    
    # horizontal victory
    won = true if grid[0][0] == player_option && grid[0][1] == player_option && grid[0][2] == player_option
    won = true if grid[1][0] == player_option && grid[1][1] == player_option && grid[1][2] == player_option
    won = true if grid[2][0] == player_option && grid[2][1] == player_option && grid[2][2] == player_option

    # vertical victory
    won = true if grid[0][0] == player_option && grid[1][0] == player_option && grid[2][0] == player_option
    won = true if grid[0][1] == player_option && grid[1][1] == player_option && grid[2][1] == player_option
    won = true if grid[0][2] == player_option && grid[1][2] == player_option && grid[2][2] == player_option

    # diagonal victory
    won = true if grid[0][0] == player_option && grid[1][1] == player_option && grid[2][2] == player_option
    won = true if grid[0][2] == player_option && grid[1][1] == player_option && grid[2][0] == player_option

    won
  end

  def check_availability?(position)
    grid = @board.grid
    available = false
    
    row = @board.find_row(position)
    col = @board.find_col(position)
    puts "player move #{grid[row][col]}"
    available = true if (grid[row][col] != 'X' && grid[row][col] != 'O')
    available
  end

end