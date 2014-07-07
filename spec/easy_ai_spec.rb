require 'easy_ai'
require 'tic_tac_toe_board'

describe EasyAI do
  before(:each) do
    @board = TicTacToeBoard.new
    @ai = EasyAI.new(@board)
  end

  it "should pick the first empty spot" do  
    @ai.get_spot_number.should == 0
  end

  it "should pick the next empty spot" do
    @board.fill_space(0, "O")
    @board.fill_space(1, "O")
    @board.fill_space(2, "O")
    @board.fill_space(3, "O")
    @ai.get_spot_number.should == 4
  end  
end