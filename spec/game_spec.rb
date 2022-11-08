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

  describe '#player_disc_input' do
    subject(:game_player_disc_input) {  described_class.new }

    context 'when the disc is inside the board parameters' do
      before do
        allow(game_player_disc_input).to receive(:gets).and_return('3')
      end
      it 'it returns the column and breaks the loop' do
        expect(game_player_disc_input.player_disc_input).to eq('3')
      end
    end

    context 'when the disc is outside the board parameters' do
      before do
        allow(game_player_disc_input).to receive(:gets).and_return('21', '3')
      end
      it 'it displays error message and then returns the column and breaks the loop' do
        message = 'Please enter a single digit for the column.'
        expect(game_player_disc_input).to receive(:puts).once
        expect(game_player_disc_input).to receive(:puts).with(message).once
        expect(game_player_disc_input.player_disc_input).to eq('3')
      end
    end
  end




end