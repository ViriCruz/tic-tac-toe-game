require '../lib/game.rb'
# frozen_string_literal: true

# main class to trigger the game and manage player's turn
class Main

  def initialize
    @game = Game.new
    @player_a, @player_b = @game.player_one, @game.player_two
  end

  def welcome
    puts "Welcome to the TIC TAC TOE GAME! #{@player_a.name} and #{@player_b.name}"
    puts "START!!!"
  end

  def start
    welcome
    
    while @game.moves < 10
      # if it's odd, player_a plays, if it's even, player_b plays
      (@game.turn.even?) ? player_turn(@player_b) : player_turn(@player_a)

      # check if it's already the 5th turn or later
      case @game.turn
      when 5..8
        # check who won, player a or b
         
        if @game.won?(@player_a.option)
          puts "#{@player_a.name} won the match. CONGRATULATIONS!"
          break
        elsif @game.won?(@player_b.option)
          puts "#{@player_b.name} won the match. CONGRATULATIONS!"
          break
        end

      when 9  
        puts "DRAW!!!!!!!!" if @game.draw?
      end
 
    end
  end

  def player_turn(player)
    available = false
    attempt = 0
    puts "Turn #{@game.turn}, #{player.name} choose a position from 1 to 9 in the table"
    @game.board.display_board

    until available
      puts "Position not available. #{player.name} choose another position from 1 to 9" if attempt > 0
      position = gets.chomp
      case @game.valid_number(position)
      when 1
        puts "valid position. checking if it's available"
        position = @game.convert_to_number(position)
        available = @game.check_availability?(position)
        attempt += 1 unless available
        if available
          attempt = 0
          @game.board.update_board(player.option, position)
        end
      
      when -1
        puts "Enter a number from 1 to 9."  
      when -2
        puts "Please enter a valid number."
      end
    end
  end
end

game = Main.new
game.start
