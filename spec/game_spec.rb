require 'game'
require 'tic_tac_toe_rules'
require 'game_options'
require 'ui'
require 'player'
require 'easy_ai'
require 'hard_ai'

class MockUI
  def send_message(message)
  end

  def receive_message
  end

  def print_board(board)
  end

  def get_winning_player
  end
end

describe Game do
  before(:each) do
    @board = TicTacToeRules.new
    @mock_ui = MockUI.new
    @ui = double(receive_player_number: 1)
    @easy_ai = EasyAI.new(@board)
    @hard_ai = HardAI.new(@board)
    @options = GameOptions.new(@ui, @board, @player, @easy_ai, @hard_ai)
    @game = Game.new(@board, @mock_ui, @options, @easy_ai, @hard_ai)
  end

  context "players" do
    it "current player is player 1 by default" do
      @game.current_player.should == @options.find_players[0]
    end

    it "alternates players" do
      @game.current_player.should == @options.find_players[0]
      @game.take_turn
      @game.current_player.should == @options.find_players[1]
      @game.take_turn
      @game.current_player.should == @options.find_players[0]
    end
  end

  context "run game" do
    before(:each) do
      @full_board = TicTacToeRules.new(1)
      @full_board.fill_space(0, 'X')
    end

    it "should take turns until game is over" do
      game = Game.new(@full_board, @mock_ui, @options, @easy_ai, @hard_ai)
      @ui.stub(:receive_difficulty)
      game.run

      game.turns_taken.should == 0
    end

    it "prints the board after the game is over" do
      mock_ui = double
      @ui.stub(:receive_difficulty)
      mock_ui.stub(:send_message)
      mock_ui.should_receive(:print_board).with(@full_board).once
      mock_ui.should_receive(:get_winning_player)

      game = Game.new(@full_board, mock_ui, @options, @easy_ai, @hard_ai)

      game.run
    end

    it "prints the board each turn" do
      test_board = TicTacToeRules.new(1)

      @ui.stub(:receive_difficulty)
      mock_ui = double
      mock_ui.stub(:receive_message)
      mock_ui.stub(:send_message)
      mock_ui.should_receive(:print_board).twice

      game = Game.new(test_board, mock_ui, @options, @easy_ai, @hard_ai)

      game.run
    end

    context "prints the end of game message after the game is over" do
      it "when X is the winner" do
        mock_ui = double
        @ui.stub(:receive_difficulty)
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:get_winning_player)
        game = Game.new(@full_board, mock_ui, @options, @easy_ai, @hard_ai)

        game.run
      end

      it "when O is the winner" do
        full_board = TicTacToeRules.new(1)
        full_board.fill_space(0, 'O')

        mock_ui = double
        @ui.stub(:receive_difficulty)
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:get_winning_player)
        game = Game.new(full_board, mock_ui, @options, @easy_ai, @hard_ai)

        game.run
      end

      it "when it's a tie" do
        full_board = TicTacToeRules.new(3)
        full_board.fill_space(0, 'X')
        full_board.fill_space(1, 'O')
        full_board.fill_space(2, 'X')
        full_board.fill_space(3, 'O')
        full_board.fill_space(4, 'X')
        full_board.fill_space(5, 'X')
        full_board.fill_space(6, 'O')
        full_board.fill_space(7, 'X')
        full_board.fill_space(8, 'O')

        @ui.stub(:receive_difficulty)
        mock_ui = double
        mock_ui.stub(:print_board)
        mock_ui.should_receive(:nobody_wins_message)

        game = Game.new(full_board, mock_ui, @options, @easy_ai, @hard_ai)

        game.run
      end
    end
  end
end

