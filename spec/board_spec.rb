require_relative '../lib/board'

describe Board do
  describe "#check_winner_rows" do
    subject(:board_check_winner_rows) { Board.new }
    context 'when there are four one player consecutive discs aligned in the first row' do

      it 'returns true' do
        expect(board_check_winner_rows.check_winner_rows).to be true
      end
    end


  end
end


