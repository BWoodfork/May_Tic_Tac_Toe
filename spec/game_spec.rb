require 'game'
require 'board'
require 'tic_tac_toe_board'
require 'player'

describe Game do
  before(:each) do
    @board = TicTacToeBoard.new
    @ui = UI.new(@output, @board)
    @game = Game.new(@board, @ui)
  end

  context "players" do
    it "current player is player 1 by default" do
      @game.current_player.should == @game.get_players[0]
    end

    it "alternates players" do
      @game.take_turn
      @game.current_player.should == @game.get_players[1]

      @game.take_turn
      @game.current_player.should == @game.get_players[0]
    end
  end

  context "run game" do
    it "should take turns until game is over" do
      #How do I test this?
    end
  end
end

