require_relative '../lib/board'

class Game
  attr_reader :current_board

  def initialize(board = Board.new)
    @current_board = board
    @player_one = ''
    @player_two = ''
    @current_player = { name: @player_one, mark: 'X' }
  end

  def play
    introduction
    @player_one = get_players('Insert name of player one')
    @player_two = get_players('Insert name of player two')
    @current_player = { name: @player_one, mark: 'X' }
    placing_discs
    ending
  end

  def introduction
    puts <<~HEREDOC
      Welcome to Four in Line!
      Please enter a different name for each player (between 3 and 10 characters).
      Have fun!
    HEREDOC
  end

  def clear_screen
    system('cls') || system('clear')
  end

  def get_players(insert_name)
    puts insert_name
    player_name_input
  end

  def player_name_input
    loop do
      user_input = gets.chomp
      verified_name = user_input if user_input.match?(/^.{3,10}$/) && @player_one != user_input
      return verified_name if verified_name

      puts 'Please enter a different name for each player (between 3 and 10 characters).'
    end
  end

  def space_free_verification
    loop do
      verified_sapce = player_mark_input.split('')
      unless current_board.update_space(verified_sapce[1].to_i - 1, verified_sapce[0].to_sym, @current_player[:mark])
        clear_screen 
        current_board.print_board
        puts 'Mark a free space'
        next
      end
      break
    end
  end

  def player_disc_input
    puts "It's #{@current_player[:name]} turn"
    loop do
      space = gets.chomp.downcase
      verified_sapce = space if space.match?(/^[1-7]$/) 
      return verified_sapce if verified_sapce

      puts 'Please enter a single digit for the column.'
    end
  end

end