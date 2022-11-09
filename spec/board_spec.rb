require_relative '../lib/board'

describe Board do
  describe "#check_winner_rows" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                ['O', 'O', 'O', 'O', nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_rows) { described_class.new(board) }
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
      subject(:board_check_winner_rows) { described_class.new(board) }
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
      subject(:board_check_winner_rows) { described_class.new(board) }
      it 'returns false' do
        expect(board_check_winner_rows.check_winner_rows).to be false
      end
    end
  end

  describe "#check_winner_columns" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                ['O', nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_columns) { described_class.new(board) }
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
      subject(:board_check_winner_columns) { described_class.new(board) }
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
        subject(:board_check_winner_columns) { described_class.new(board) }
        it 'returns false' do
        expect(board_check_winner_columns.check_winner_columns).to be false
      end
    end
  end

  describe "#check_winner_left_to_right_diagonals" do
    context 'when there are four one player consecutive discs aligned' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, 'O', nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, nil, 'O', nil, nil, nil],
                [nil, nil, nil, nil, 'O', nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_winner_diagonals) { described_class.new(board) }
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
      subject(:board_check_winner_diagonals) { described_class.new(board) }
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
      subject(:board_check_winner_diagonals) { described_class.new(board) }
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
        subject(:board_check_winner_diagonals) { described_class.new(board) }
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
        subject(:board_check_winner_diagonals) { described_class.new(board) }
        it 'returns false' do
          expect(board_check_winner_diagonals.check_winner_right_to_left_diagonals).to be false
        end
      end

      context 'when there are four one player consecutive discs aligned' do
        board = [ [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, 0, 0, 0, 0, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil]]
        subject(:board_check_winner_diagonals) { described_class.new(board) }
        it 'returns true' do
          expect(board_check_winner_diagonals.check_winner_right_to_left_diagonals).to be false
        end
      end
    end
  end

  describe "#update_space" do
    context 'when the first column is empty and you add a disc' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_update_space) { described_class.new(board) }
      it 'adds a disc to the bottom row of the first column' do
        board_update_space.update_space(0, 'O')
        expect(board_update_space.board[5][0]).to eq('O')
      end
    end

    context 'when the third column has two discs and you add a disc' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil]]
      subject(:board_update_space) { described_class.new(board) }
      it 'adds a circle to the third row of the third column' do
        board_update_space.update_space(2, 'O')
        expect(board_update_space.board[3][2]).to eq('O')
      end
    end

    context 'when the third column has two discs and you add two discs' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil]]
      subject(:board_update_space) { described_class.new(board) }

      it 'adds two circles to the third row of the third column' do
        board_update_space.update_space(2, 'O')
        expect(board_update_space.board[3][2]).to eq('O')
        board_update_space.update_space(2, 'O')
        expect(board_update_space.board[2][2]).to eq('O')
      end
    end

    context 'when the third column is full and you add a disc' do
      board = [ [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil],
                [nil, nil, 'O', nil, nil, nil, nil]]
      subject(:board_update_space) { described_class.new(board) }

      it 'to return false' do
        board_update_space.update_space(2, 'O')
        expect(board_update_space.update_space(2, 'O')).to be false
      end
    end
  end

  describe "#check_for_winner" do
    context 'when the 7th colum has four vertical in line' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, 1],
                [nil, nil, nil, nil, nil, nil, 1],
                [nil, nil, nil, nil, nil, nil, 1],
                [nil, nil, nil, nil, nil, nil, 1]]
      subject(:board_check_for_winner) { described_class.new(board) }
      it "returns true" do
        expect(board_check_for_winner.check_for_winner).to be true
      end
    end

    context 'when the last row has four horizontal in line' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil,  1, 1, 1, 1, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_for_winner) { described_class.new(board) }
      it "returns true" do
        expect(board_check_for_winner.check_for_winner).to be true
      end
    end

    context 'when a diagonal left to right has for in line' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [1, nil, nil, nil, nil, nil, nil],
                [nil, 1, nil, nil, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil]]
      subject(:board_check_for_winner) { described_class.new(board) }
      it "returns true" do
        expect(board_check_for_winner.check_for_winner).to be true
      end
    end

    context 'when a diagonal right to left has for in line' do
      board = [ [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, 1, nil],
                [nil, nil, nil, nil, 1, nil, nil],
                [nil, nil, nil, 1, nil, nil, nil],
                [nil, nil, 1, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil]]
      subject(:board_check_for_winner) { described_class.new(board) }
      it "returns true" do
        expect(board_check_for_winner.check_for_winner).to be true
      end
    end

    context 'when a there are no four in line' do
      board = [ [1, nil, nil, 1, nil, nil, nil],
                [nil, 1, nil, nil, nil, 1, nil],
                [nil, nil, nil, nil, 1, nil, nil],
                [1, 0, nil, nil, nil, nil, nil],
                [1, 0, 1, nil, 0, 0, 0],
                [nil, 0, nil, nil, 1, 1, 1]]
      subject(:board_check_for_winner) { described_class.new(board) }
      it "returns false" do
        expect(board_check_for_winner.check_for_winner).to be false
      end
    end
  end

end


