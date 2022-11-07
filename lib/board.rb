class Board
  ROWS = 6
  COLUMNS = 7
  attr_reader :board

  def initialize(board = Array.new(ROWS){Array.new(COLUMNS)} )
    @board = board
  end

  def check_winner_rows
    board.each_with_index do | row, row_index |
      count = 0
      row.each_with_index do | cell, cell_index |
        if cell == board[row_index][cell_index - 1] && !cell.nil? && cell_index > 0
          count += 1
        else
          count = 0
        end 
      end
      return true if count >= 3

    end
    false
  end

  

end

