require_relative '../lib/board'

describe Board do
  describe "#check_winner_rows" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, 'O', 'O', 'O', 'O'],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_rows) { Board.new(board) }
      it 'returns true' do
        expect(board_check_winner_rows.check_winner_rows).to be true
      end
    end
    context 'when there are four or more one player discs aligned but not consecutive' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                ['O', 'O', 'O', nil, 'O', 'O', 'O'],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_rows) { Board.new(board) }
      it 'returns false' do
        expect(board_check_winner_rows.check_winner_rows).to be false
      end
    end
    context 'when all the board is empty' do

      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil], 
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_rows) { Board.new(board) }
      it 'returns false' do
        expect(board_check_winner_rows.check_winner_rows).to be false
      end
    end
  end

  describe "#check_winner_columns" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_columns) { Board.new(board) }
      it 'returns true' do
        expect(board_check_winner_columns.check_winner_columns).to be true
      end
    end
    
    context 'when there are four or more one player discs aligned but not consecutive' do
      board = [ [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil]]
      subject(:board_check_winner_columns) { Board.new(board) }
      it 'returns false' do
        expect(board_check_winner_columns.check_winner_columns).to be false
      end
    end
    context 'when all the board is empty' do

      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil], 
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
        subject(:board_check_winner_columns) { Board.new(board) }
        it 'returns false' do
        expect(board_check_winner_columns.check_winner_columns).to be false
      end
    end
  end

  describe "#check_winner_left_to_right_diagonals" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ ['O', nil, nil, nil, nil, nil, nil],
                [nil, 'O', nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, nil, 'O', nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_diagonals) { Board.new(board) }
      it 'returns true' do
        expect(board_check_winner_diagonals.check_winner_left_to_right_diagonals).to be true
      end
    end

    context 'when there are four one player consecutive discs aligned but not consecutive' do
      board = [ ['O', nil, nil, nil, nil, nil, nil],
                [nil, 'O', nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, 'O', nil, nil],
                [nil, nil, nil, nil, nil, 'O', nil]]
      subject(:board_check_winner_diagonals) { Board.new(board) }
      it 'returns false' do
        expect(board_check_winner_diagonals.check_winner_left_to_right_diagonals).to be false
      end
    end

    context 'when all the board is empty' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_diagonals) { Board.new(board) }
      it 'returns false' do
        expect(board_check_winner_diagonals.check_winner_left_to_right_diagonals).to be false
      end
    end

    describe "#check_winner_right_to_left_diagonals" do
      context 'when there are four one player consecutive discs aligned' do
        board = [ [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, 'O', nil, nil],
                  [nil, nil, nil, 'O', nil, nil, nil],
                  [nil, nil, 'O', nil, nil, nil, nil],
                  [nil, 'O', nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil]]
        subject(:board_check_winner_diagonals) { Board.new(board) }
        it 'returns true' do
          expect(board_check_winner_diagonals.check_winner_right_to_left_diagonals).to be true
        end
      end

      context 'when there are four one player non consecutive discs aligned' do
        board = [ [nil, nil, nil, nil, nil, 'O', nil],
                  [nil, nil, nil, nil, 'O', nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, 'O', nil, nil, nil, nil],
                  [nil, 'O', nil, nil, nil, nil, nil],
                  ['O', nil, nil, nil, nil, nil, nil]]
        subject(:board_check_winner_diagonals) { Board.new(board) }
        it 'returns false' do
          expect(board_check_winner_diagonals.check_winner_right_to_left_diagonals).to be false
        end
      end

      context 'when there are four one player consecutive discs aligned' do
        board = [ [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil]]
        subject(:board_check_winner_diagonals) { Board.new(board) }
        it 'returns true' do
          expect(board_check_winner_diagonals.check_winner_right_to_left_diagonals).to be false
        end
      end
    end


  end
end


