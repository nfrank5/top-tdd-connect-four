class Board
  ROWS = 6
  COLUMNS = 7
  attr_accessor :board

  def initialize(board = Array.new(ROWS){Array.new(COLUMNS)} )
    @board = board
  end

  def check_for_winner
    check_winner_rows || check_winner_columns || check_winner_left_to_right_diagonals || check_winner_right_to_left_diagonals
  end

  def check_winner_rows
    board.each_with_index do |row, row_index|
      count = 0
      row.each_with_index do |cell, cell_index|
        if cell_index.positive? && cell == board[row_index][cell_index - 1] && !cell.nil?
          count += 1
          return true if count >= 3
        else
          count = 0
        end 
      end
    end
    false
  end

  def check_winner_columns
    Array((0..6)).each do | column |
      count = 0
      Array((0..5)).each do | row |
        if row > 0 && board[row][column] == board[row - 1][column] && !board[row][column].nil?
          count += 1
          return true if count >= 3
        else
          count = 0
        end 
      end
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
          return true if count >= 3
        else
          count = 0
        end 
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
    if column.between?(0, 6) && @board[0][column].nil?
      (0..5).each do |row|
        if row + 1 == 6 || !@board[row + 1][column].nil? 
          @board[row][column] = value
          return true
        end
      end
    end
    false
  end

  def print_board
    
    puts "\n | 1| 2| 3| 4| 5| 6| 7|\n\t"
    @board.each do |row|
      puts " |#{p_s(row[0])}|#{p_s(row[1])}|#{p_s(row[2])}|#{p_s(row[3])}|#{p_s(row[4])}|#{p_s(row[5])}|#{p_s(row[6])}|"
    end
    puts "\n\t"
  end

  def p_s(space)
    !space.nil? ? space.to_s : '  '
  end
end

