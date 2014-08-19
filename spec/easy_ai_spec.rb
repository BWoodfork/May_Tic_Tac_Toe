require 'easy_ai'
require 'tic_tac_toe_board'

describe EasyAI do
  before(:each) do
    @ttt_board = TicTacToeBoard.new
    @ai = EasyAI.new(@ttt_board)
  end

  it "should pick the first empty spot" do  
    @ai.get_spot_number.should == 0
  end

  it "should pick the next empty spot" do
    @ttt_board.fill_space(0, "O")
    @ttt_board.fill_space(1, "O")
    @ttt_board.fill_space(2, "O")
    @ttt_board.fill_space(3, "O")
    
    @ai.get_spot_number.should == 4
  end  
end