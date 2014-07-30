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

    # it "should return the move to tie the game" do
    #   @board.fill_space(0, "X")
    #   @board.fill_space(1, "O")
    #   @board.fill_space(2, "X")

    #   @board.fill_space(3, "X")
    #   @board.fill_space(4, "O")
    #   @board.fill_space(5, "O")

    #   @board.fill_space(6, "O")
    #   @board.fill_space(7, "X")
    #   @board.fill_space(8, "X")

    #   @hard.minimax(@board).should == 50
    # end
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


      @hard.check_empty_spaces(@board).should == [8]
    end
  end
  
  context "#clone_board" do
    it "should clone a duplicate of the existing board" do
      new_board = @board.spaces
      @hard.clone_board(@board).object_id.should_not == new_board.object_id
    end

    it "should clone duplicate spaces" do
      new_board = @board.spaces
      @hard.clone_board(@board).object_id.should_not == @board.object_id
    end
  end

  context "#score" do
    describe "scoring conditions" do
      it "should return score of 100 at a win" do
        @board.fill_space(0, "O")
        @board.fill_space(1, "X")
        @board.fill_space(2, "X")

        @board.fill_space(3, "O")
        @board.fill_space(4, "X")
        @board.fill_space(6, "O")

        @hard.score_move(@board).should == 100
      end

      it "should return score of 0 at a loss" do
        @board.fill_space(0, "O")
        @board.fill_space(1, "X")
        @board.fill_space(2, "X")

        @board.fill_space(4, "O")
        @board.fill_space(5, "X")
        @board.fill_space(6, "O")

        @board.fill_space(8, "X")

        @hard.score_move(@board).should == 0
      end

      it "should return a score of 50 at a tie" do
        @board.fill_space(0, "O")
        @board.fill_space(1, "X")
        @board.fill_space(2, "O")

        @board.fill_space(3, "X")
        @board.fill_space(4, "X")
        @board.fill_space(5, "O")

        @board.fill_space(6, "O")
        @board.fill_space(7, "O")
        @board.fill_space(8, "X")

        @hard.score_move(@board).should == 50
      end
    end
  end
end