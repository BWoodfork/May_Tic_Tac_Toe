require 'hard_ai'
require 'tic_tac_toe_board'

describe HardAI do
  before(:each) do
    @ttt_board = TicTacToeBoard.new(3)
    @hard = HardAI.new(@ttt_board)
  end

  context "minimax" do
    it "should return the winning move" do
      @ttt_board.fill_space(0, "X")
      @ttt_board.fill_space(1, "O")
      @ttt_board.fill_space(2, "X")

      @ttt_board.fill_space(3, "X")
      @ttt_board.fill_space(4, "O")
      
      @hard.minimax(@ttt_board).should == 7

    end

    it "should return the move to tie the game" do
      @ttt_board.fill_space(0, "X")
      @ttt_board.fill_space(1, "O")
      @ttt_board.fill_space(2, "X")

      @ttt_board.fill_space(3, "X")
      @ttt_board.fill_space(4, "O")
      @ttt_board.fill_space(5, "O")

      @ttt_board.fill_space(6, "O")
      @ttt_board.fill_space(7, "X")

      @hard.minimax(@ttt_board).should == 8
    end

    it "should return the move to block a win" do
      @ttt_board.fill_space(0, "X")
      @ttt_board.fill_space(7, "O")
      @ttt_board.fill_space(2, "X")

      @hard.minimax(@ttt_board).should == 1
    end
  end
end