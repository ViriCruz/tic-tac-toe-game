# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# game class that will handle who is the winner or if it's a draw
class Game
  attr_reader :board, :player_one, :player_two, :turn

  def initialize
    @board = Board.new
    @player_one = Player.new('Player X', 'X')
    @player_two = Player.new('Player O', 'O')
    @moves = 0
    @turn = @moves
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

  def draw?
    arr = []
    @board.grid.each do |row|
      row.each do |state|
        arr << state if state != 'X' && state != 'O'
      end
    end

    (arr.empty?) ? true : false
  end

  def check_availability?(position)
    grid = @board.grid
    available = false
    row = @board.find_row(position.to_i)
    col = @board.find_col(position.to_i)
    available = true if grid[row][col] != 'X' && grid[row][col] != 'O'
    available
  end

  def moves
    @moves += 1
    @turn = @moves
    @moves 
  end

  def valid_number(position)
    status = 0
    valid = position =~ /[1-9]/
    if valid.zero?
      position = convert_to_number(position)
      (position > 0 && position < 10) ? status = 1 : status = -1
    else
      status = -2
    end
    status
  end

  def convert_to_number(position)
    position.to_i
  end
end
