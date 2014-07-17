require 'hard_ai'
require 'tic_tac_toe_board'

describe HardAI do
  before(:each) do
    @board = TicTacToeBoard.new(3)
    @hard = HardAI.new(@board)
  end
  
  context "#generate_board" do
    it "should generate a duplicate of the existing board" do
      new_board = @board.spaces
      @hard.generate_board(@board).object_id.should_not == new_board.object_id
    end
  end

  context "#score" do
    describe "scoring conditions" do
      it "should return a score of 1 if O is the winner" do
        @board.fill_space(0, "O")
        @board.fill_space(1, "O")
        @board.fill_space(2, "O")

        @hard.score.should == 100
      end

      it "should return score 1 if O is the winner vertically" do
        @board.fill_space(0, "O")
        @board.fill_space(3, "O")
        @board.fill_space(6, "O")

        @hard.score.should == 100
      end

      it "should return a score of -1 if X is the winner" do
        @board.fill_space(0, "X")
        @board.fill_space(1, "X")
        @board.fill_space(2, "X")

        @hard.score.should == 50
      end

      it "should return a score of 0 in any other case" do
        @board.fill_space(0, "X")
        @board.fill_space(1, "O")
        @board.fill_space(2, "X")

        @hard.score.should == 0
      end

      it "should return a score of 0 when the board is empty" do
        @board == TicTacToeBoard.new(3)
        @hard.score.should == 0
      end
    end
  end
end