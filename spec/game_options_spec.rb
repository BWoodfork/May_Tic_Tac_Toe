require 'game_options'
require 'player'
require 'easy_ai'
require 'ui'
require 'hard_ai'

describe GameOptions do
  before(:each) do
    @ui = double(receive_player_number: 1)
    @board = TicTacToeBoard.new
    @options = GameOptions.new(@ui, @board)
  end
end