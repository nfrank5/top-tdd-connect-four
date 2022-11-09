require_relative '../lib/game'
require_relative '../lib/board'

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
        allow(game_player_disc_input).to receive(:puts)
        allow(game_player_disc_input).to receive(:current_player).and_return({ name: 'Asd', disc: 'X' })
      end
      it 'it returns the column and breaks the loop' do
        expect(game_player_disc_input.player_disc_input).to eq(2)
      end
    end

    context 'when the disc is outside the board parameters once' do
      before do
        allow(game_player_disc_input).to receive(:gets).and_return('21', '3')
        allow(game_player_disc_input).to receive(:current_player).and_return({ name: 'Asd', disc: 'X' })
      end
      it 'it displays error message and then returns the column and breaks the loop' do
        message = 'Please enter a single digit between 1 and 7.'
        expect(game_player_disc_input).to receive(:puts).once
        expect(game_player_disc_input).to receive(:puts).with(message).once
        expect(game_player_disc_input.player_disc_input).to eq(2)
      end
    end
  end


  describe '#column_update_verification' do
    subject(:game_free_column) { described_class.new(board_free_column) }
    b = [ ['O', nil, nil, nil, nil, nil, nil],
          ['O', nil, nil, nil, nil, nil, nil],
          ['O', nil, nil, nil, nil, nil, nil],
          ['O', nil, nil, nil, nil, nil, nil],
          ['O', nil, nil, nil, nil, nil, nil],
          ['O', nil, nil, nil, nil, nil, nil]]
    let(:board_free_column) { instance_double(Board, board: b) }

    context 'when the space is free' do
      before do
        allow(game_free_column).to receive(:player_disc_input).and_return('3')
        allow(board_free_column).to receive(:update_space).and_return(true)
        allow(game_free_column).to receive(:clear_screen)
        allow(game_free_column).to receive(:current_player).and_return({ name: 'Asd', disc: 'X' })
      end
      it 'breaks the loop' do
        expect(board_free_column).not_to receive(:print_board)
        expect(board_free_column).to receive(:update_space).once
        game_free_column.column_update_verification
      end
    end

    context 'when the space is not free once and then is empty' do
      before do
        allow(game_free_column).to receive(:player_disc_input).and_return('0', '3')
        allow(board_free_column).to receive(:update_space).and_return(false, true)
        allow(game_free_column).to receive(:clear_screen)
        allow(game_free_column).to receive(:puts)
        allow(game_free_column).to receive(:current_player).and_return({ name: 'Asd', disc: 'X' })


      end
      it 'doesn\'t break the loop the first time' do
        expect(board_free_column).to receive(:print_board).once
        expect(board_free_column).to receive(:update_space).twice
        game_free_column.column_update_verification
      end
    end
  end

  describe '#placing_discs' do
    subject(:game_placing_discs) { described_class.new(board_placing_discs) }
    let(:board_placing_discs) { instance_double(Board) }
    context 'when there is no winner' do
      before do
        allow(board_placing_discs).to receive(:print_board)
        allow(board_placing_discs).to receive(:check_for_winner)
        allow(game_placing_discs).to receive(:clear_screen)
        allow(game_placing_discs).to receive(:puts)
        allow(game_placing_discs).to receive(:current_player).and_return({ name: 'Asd', disc: 'X' })
      end
      it 'breaks the loop after 42 turns' do
        expect(game_placing_discs).to receive(:column_update_verification).exactly(42).times
        game_placing_discs.placing_discs
      end
    end

    context 'when there is a winner' do
      before do
        allow(board_placing_discs).to receive(:print_board)
        allow(board_placing_discs).to receive(:check_for_winner).and_return(true)
        allow(game_placing_discs).to receive(:clear_screen)
        allow(game_placing_discs).to receive(:puts)
      end

      it 'breaks the loop if check_for_winner returns true' do
        expect(game_placing_discs).to receive(:column_update_verification).once
        game_placing_discs.placing_discs
      end

    end
  end


end