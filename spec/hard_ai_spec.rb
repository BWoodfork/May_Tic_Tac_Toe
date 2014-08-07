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

  context "#empty_spaces" do
    it "should return empty spaces" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "X")
      @board.fill_space(2, "X")

      @board.fill_space(3, "X")
      @board.fill_space(4, "X")
      @board.fill_space(5, "X")

      @board.fill_space(6, "X")
      @board.fill_space(7, "X")


      @hard.get_empty_spaces(@board).should == [8]
    end
  end

  context "#score_board_state" do
    it "should return a score of 1 if game winner is HardAI" do
      @board.fill_space(0, "O")
      @board.fill_space(1, "O")
      @board.fill_space(2, "O")

      @board.fill_space(3, "X")
      @board.fill_space(5, "X")
      @board.fill_space(6, "X")
      
      @hard.score_board_state(@board).should == 1
    end

    it "should return a score of -1 if game winner is Human" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "X")
      @board.fill_space(2, "X")

      @board.fill_space(3, "O")
      @board.fill_space(5, "O")
      @board.fill_space(6, "O")

      @hard.score_board_state(@board).should == -1
    end

    it "should return a score of 0 if it's a tie game" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "X")
      @board.fill_space(2, "O")

      @board.fill_space(3, "O")
      @board.fill_space(4, "X")
      @board.fill_space(5, "X")

      @board.fill_space(6, "X")
      @board.fill_space(7, "O")
      @board.fill_space(8, "O")

      @hard.score_board_state(@board).should == 0
    end
  end
  
  context "#duplicate board" do
    it "should generate a duplicate of the board" do
      @hard.duplicate_board(@board).object_id.should_not == @board.object_id
    end
  end
end