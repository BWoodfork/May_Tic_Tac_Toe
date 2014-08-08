require 'hard_ai'
require 'tic_tac_toe_board'

describe HardAI do
  before(:each) do
    @board = TicTacToeBoard.new(3)
    @hard = HardAI.new(@board)
  end

  context "minimax" do
    it "should return the winning move" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "O")
      @board.fill_space(2, "X")

      @board.fill_space(3, "X")
      @board.fill_space(4, "O")
      
      @hard.minimax(@board).should == 7

    end

    it "should return the move to tie the game" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "O")
      @board.fill_space(2, "X")

      @board.fill_space(3, "X")
      @board.fill_space(4, "O")
      @board.fill_space(5, "O")

      @board.fill_space(6, "O")
      @board.fill_space(7, "X")

      @hard.minimax(@board).should == 8
    end

    it "should return the move to block a win" do
      @board.fill_space(0, "X")
      @board.fill_space(7, "O")
      @board.fill_space(2, "X")

      @hard.minimax(@board).should == 1
    end
  end
end