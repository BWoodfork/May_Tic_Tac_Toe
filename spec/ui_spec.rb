require 'ui'
require 'board'
require 'game'

describe UI do
  before(:each) do
    @ui = UI.new(@output, @board)
    @output = StringIO.new
    @board = TicTacToeBoard.new
  end

  xit "should receive player's input for playing a spot on board" do
    board = TicTacToeBoard.new(1)

    allow(@ui).to receive(:get_move) { 0 }
    @ui.get_move(@board)
    board.should == ["X"]
  end

end