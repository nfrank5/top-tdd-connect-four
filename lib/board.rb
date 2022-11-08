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

  def check_winner_columns
    Array((0..6)).each do | column |
      count = 0
      Array((0..5)).each do | row |
        if row > 0 && board[row][column] == board[row - 1][column] && !board[row][column].nil?
          count += 1
        else
          count = 0
        end 
      end
      return true if count >= 3
    end
    false
  end

  def check_winner_left_to_right_diagonals
    [[2,0],[1,0],[0,0],[0,1],[0,2],[0,3]].map do | initial |
      row = initial[0]
      column = initial[1]
      count = 0
      first = true
      while row <= 5 && column <= 6
        if first
          first = false
          row += 1
          column += 1
          next
        end
        if board[row][column] == board[row - 1][column - 1] && !board[row][column].nil?
          count += 1
        else
          count = 0
        end 
        return true if count >= 3
        row += 1
        column += 1
      end 
    end
    false
  end

  def check_winner_right_to_left_diagonals
    [[2,6],[1,6],[0,6],[0,5],[0,4],[0,3]].map do | initial |
      row = initial[0]
      column = initial[1]
      count = 0
      first = true
      while row <= 5 && column <= 6
        if first
          first = false
          row += 1
          column -= 1
          next
        end
        if board[row][column] == board[row - 1][column + 1] && !board[row][column].nil?
          count += 1
        else
          count = 0
        end 
        return true if count >= 3

        row += 1
        column -= 1
      end
    end
    false
  end

  def update_space(column, value)
    if column.between?(0, 6) && board[0][column].nil?
      (0..5).each do |row|
        if row + 1 == 6 || !board[row + 1][column].nil? 
          board[row][column] = value
          return true
        end
      end
    end
    false
  end

  def print_board
    puts "\n | 1 | 2 | 3 | 4 | 5 | 6 | 7 |\n\t"
    board.each do |row|
      puts " | #{!row[0].nil? ? row[0] : ' ' } | #{!row[1].nil? ? row[1] : ' ' } | #{!row[2].nil? ? row[2] : ' ' } | #{!row[3].nil? ? row[3] : ' ' } | #{!row[4].nil? ? row[4] : ' ' } | #{!row[5].nil? ? row[5] : ' ' } | #{!row[6].nil? ? row[6] : ' ' } |"
    end
  end
end

