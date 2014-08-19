require 'game_options'
require 'ui'
require 'tic_tac_toe_board'

describe GameOptions do
  before(:each) do
    @ttt_board = TicTacToeBoard.new
    @ui = UI.new(@ttt_board)
    @player = Player.new
    @easy_ai = EasyAI.new(@ttt_board)
    @hard_ai = HardAI.new(@ttt_board)
    @options = GameOptions.new(@ui, @ttt_board, @player, @easy_ai, @hard_ai)
  end

  it "should receive the player number" do
    @ui.stub(:receive_player_number) { 1 }
    @ui.stub(:receive_player_number) { 2 }
  end

  it "should receive the easy game difficulty" do
    @ui.stub(:receive_difficulty) { "easy" }
  end

  it "should receive the hard game difficulty" do
    @ui.stub(:receive_difficulty) { "hard" }
  end
end