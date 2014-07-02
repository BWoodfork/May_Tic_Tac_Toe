require 'easy_ai'
require 'tic_tac_toe_board'

describe EasyAI do
  board = TicTacToeBoard.new
  ai = EasyAI.new(board)
  
  it "should have an easy AI" do
    ai.class.should == EasyAI
  end

  it "should pick the first empty spot" do
    board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]  
    ai.pick_a_spot.should == 0
  end

  it "should pick the next empty spot" do
    board = ["o", nil, nil, nil, nil, nil, nil, nil, nil]
    ai.pick_a_spot.should == 1
  end
end