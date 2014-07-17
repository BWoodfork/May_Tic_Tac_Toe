require 'game'
require 'tic_tac_toe_board'
require 'player_factory'
require 'ui'

class MockUI
  def send_message(message)
  end

  def receive_message
  end

  def print_board(board)
  end
end

describe Game do
  before(:each) do
    @board = TicTacToeBoard.new
    @mock_ui = MockUI.new
    @ui = double(receive_player_number: 1)
    @factory = PlayerFactory.new(@ui)
    @easy_ai = EasyAI.new(@board)
    @game = Game.new(@board, @mock_ui, @factory, @easy_ai)
  end

  context "players" do
    it "current player is player 1 by default" do
      @factory.setup_players
      @game.current_player.should == @factory.find_players[0]
    end

    it "alternates players" do
      @factory.setup_players

      @game.current_player.should == @factory.find_players[0]
      @game.take_turn
      @game.current_player.should == @factory.find_players[1]
      @game.take_turn
      @game.current_player.should == @factory.find_players[0]
    end
  end

  context "run game" do
    before(:each) do
      @full_board = TicTacToeBoard.new(1)
      @full_board.fill_space(0, 'X')
    end

    it "should take turns until game is over" do
      game = Game.new(@full_board, @mock_ui, @factory, @easy_ai)
      game.run

      game.turns_taken.should == 0
    end

    it "prints the board after the game is over" do
      mock_ui = double
      mock_ui.stub(:send_message)
      mock_ui.should_receive(:print_board).with(@full_board).once
      game = Game.new(@full_board, mock_ui, @factory, @easy_ai)

      game.run
    end

    it "prints the board each turn" do
      test_board = TicTacToeBoard.new(1)
      mock_ui = double
      mock_ui.stub(:receive_message)
      mock_ui.stub(:send_message)
      mock_ui.should_receive(:print_board).twice
      game = Game.new(test_board, mock_ui, @factory, @easy_ai)

      game.run
    end

    context "prints the end of game message after the game is over" do
      it "when X is the winner" do
        mock_ui = double
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:send_message).with("X is the winner").once
        game = Game.new(@full_board, mock_ui, @factory, @easy_ai)

        game.run
      end

      it "when O is the winner" do
        full_board = TicTacToeBoard.new(1)
        full_board.fill_space(0, 'O')
        mock_ui = double
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:send_message).with("O is the winner").once
        game = Game.new(full_board, mock_ui, @factory, @easy_ai)

        game.run
      end

      it "when it's a tie" do
        full_board = TicTacToeBoard.new(3)
        full_board.fill_space(0, 'X')
        full_board.fill_space(1, 'O')
        full_board.fill_space(2, 'X')
        full_board.fill_space(3, 'O')
        full_board.fill_space(4, 'X')
        full_board.fill_space(5, 'X')
        full_board.fill_space(6, 'O')
        full_board.fill_space(7, 'X')
        full_board.fill_space(8, 'O')

        mock_ui = double
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:send_message).with("Nobody wins this game").once
        game = Game.new(full_board, mock_ui, @factory, @easy_ai)

        game.run
      end
    end
  end
end

