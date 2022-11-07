require_relative '../lib/board'

describe Board do
  describe "#check_winner_rows" do
    context 'when there are four one player consecutive discs aligned in a row' do
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
    context 'when there are four or more one player discs aligned in a row but not consecutive' do
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
end


