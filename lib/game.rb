require_relative 'board'
require_relative 'player'

# frozen_string_literal: true

# game class that will handle who is the winner or if it's a draw
class Game
  attr_reader :board, :player_one, :player_two
  def initialize
    @board = Board.new
    @player_one = Player.new('Player X', 'X')
    @player_two = Player.new('Player O', 'O')
  end


  def winner
    grid = @board.grid

    grid.each_with_index do |row, r_idx|

      row.each_with_index do |cell, c_idx|
        case cell 
        when 'X'
          return player_one.name if grid[r_idx][c_idx + 1] == 'X' && grid[r_idx][c_idx + 2] == 'X'
        when 'O'
          return player_two.name if grid[r_idx][c_idx + 1] == 'O' && grid[r_idx][c_idx + 2] == 'O'
        end
      end 

    end

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

game = Game.new
puts "Player X and Player O are ready to play!"
5.times do 
  
  puts "Player X choose a position from 1 to 9"
  position = gets.chomp.to_i
  available = game.check_availability?(position)
  puts available

  while available == false
    puts "choose another position"
    position = gets.chomp.to_i
    available = game.check_availability?(position)
  end
  game.board.update_board(game.player_one.option, position) if available

  puts "Player O choose a position from 1 to 9"
  position = gets.chomp.to_i
  available = game.check_availability?(position)
  puts available
  while available == false
    puts "choose another position"
    position = gets.chomp.to_i
    available = game.check_availability?(position)
  end
  game.board.update_board(game.player_two.option, position) if available
    
 
end

print game.winner