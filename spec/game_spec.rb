require_relative '../lib/game'

describe Game do
  describe '#player_name_input' do
    subject(:game_players_name) { described_class.new }
    context 'when the input is valid' do
      before do
        valid_input = 'Name1'
        allow(game_players_name).to receive(:gets).and_return(valid_input)
      end
      it 'stops loop and does not display error message' do
        error_message = 'Please enter a different name for each player (between 3 and 10 characters).'
        expect(game_players_name).not_to receive(:puts).with(error_message)
        game_players_name.player_name_input
      end
    end

    context 'when the input is invalid once' do
      before do
        invalid_input = 'Namethatistoolong1234567890'
        valid_input = 'Name1'
        allow(game_players_name).to receive(:gets).and_return(invalid_input, valid_input)
      end
      it 'display error message once then stops loop and does not display error message' do
        error_message = 'Please enter a different name for each player (between 3 and 10 characters).'
        expect(game_players_name).to receive(:puts).with(error_message).once
        game_players_name.player_name_input
      end
    end

    context 'when the input is invalid twice' do
      before do
        invalid_input1 = 'Name1234567890'
        invalid_input2 = ''
        valid_input = 'Name1'
        allow(game_players_name).to receive(:gets).and_return(invalid_input1, invalid_input2, valid_input)
      end
      it 'display error message twice then stops loop and does not display error message' do
        error_message = 'Please enter a different name for each player (between 3 and 10 characters).'
        expect(game_players_name).to receive(:puts).with(error_message).twice
        game_players_name.player_name_input
      end
    end
  end
end