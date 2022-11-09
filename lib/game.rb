require_relative '../lib/board'

class Game
  attr_reader :current_board, :current_player, :player_one_name, :player_two_name

  def initialize(board = Board.new)
    @current_board = board
    @player_one_name = ''
    @player_two_name = ''
    @current_player = ''
  end

  def play
    introduction
    @player_one_name = get_players('Insert name of player one')
    @player_two_name = get_players('Insert name of player two')
    @current_player = { name: player_one_name, disc: "\u26BD" }
    placing_discs
    ending
  end

  def placing_discs
    clear_screen
    current_board.print_board  
    42.times do
      puts "#{player_one_name}: is \u26BD and #{player_two_name} is: \u26D4"
      column_update_verification
      break if current_board.check_for_winner
      
      clear_screen
      @current_board.print_board 
      @current_player = switch_turn
    end
  end

  def column_update_verification
    loop do
      space = player_disc_input
      unless @current_board.update_space(space, current_player[:disc])
        clear_screen 
        current_board.print_board
        puts 'Please, select a free column'
        next
      end
      break
    end
  end

  def player_disc_input
    puts "\nIt's #{current_player[:name]} turn"
    loop do
      space = gets.chomp
      verified_space = space if space.match?(/^[1-7]$/) 
      return verified_space.to_i - 1 if verified_space

      puts 'Please enter a single digit between 1 and 7.'
    end
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
      verified_name = user_input if user_input.match?(/^.{3,10}$/) && player_one_name != user_input
      return verified_name if verified_name

      puts 'Please enter a different name for each player (between 3 and 10 characters).'
    end
  end

  def switch_turn
    if current_player[:name] == player_one_name
      { name: player_two_name, disc: "\u26D4" }
    else
      { name: player_one_name, disc: "\u26BD" }
    end
  end

  def ending
    clear_screen
    current_board.print_board
    if current_board.check_for_winner
      puts "#{@current_player[:name]} #{@current_player[:disc]} is the winner!!!"
    else
      clear_screen
      current_board.print_board(true)
      puts "It's a draw"
    end
  end

end