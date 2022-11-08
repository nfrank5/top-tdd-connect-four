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
    placing_marks
    ending
  end

  def introduction
    puts <<~HEREDOC
      Welcome to Four in Line!
      Please enter a different name for each player (between 3 and 10 characters).
      Have fun!
    HEREDOC
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

end