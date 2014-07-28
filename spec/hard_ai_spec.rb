require 'hard_ai'
require 'tic_tac_toe_board'

describe HardAI do
  before(:each) do
    @board = TicTacToeBoard.new(3)
    @hard = HardAI.new(@board)
  end

  context "minimax" do
    it "should return the first winning move" do
      @board.fill_space(0, "O")
      @board.fill_space(1, "X")
      @board.fill_space(2, "X")
      @board.fill_space(4, "X")
      @board.fill_space(6, "O")

      @hard.minimax(@board).should == 3
    end

    it "should return the next winning move" do
      @board.fill_space(0, "O")
      @board.fill_space(1, "O")
      @board.fill_space(4, "X")
      @board.fill_space(3, "X")
      @board.fill_space(6, "X")

      @hard.minimax(@board).should == 2
    end

    xit "should score the empty spaces on the board" do
      @board.fill_space(0, "O")
      @board.fill_space(1, "X")
      @board.fill_space(2, "X")
      @board.fill_space(4, "X")
      @board.fill_space(6, "O")

      spot = []
      @hard.score(@board, spot).should == 100
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


      @hard.check_empty_spaces(@board).should == [8]
    end
  end
  
  context "#clone_board" do
    it "should clone a duplicate of the existing board" do
      new_board = @board.spaces
      @hard.clone_board(@board).object_id.should_not == new_board.object_id
    end
  end

  context "#score" do
    describe "scoring conditions" do
      xit "should return a score of 1 if O is the winner" do
        @board.fill_space(0, "O")
        @board.fill_space(1, "O")
        @board.fill_space(2, "O")

        possible_moves = {}
        spot = []

        @hard.score(@board, spot).should == 100
      end

      xit "should return score 1 if O is the winner vertically" do
        @board.fill_space(0, "O")
        @board.fill_space(3, "O")
        @board.fill_space(6, "O")

        possible_moves = {}
        spot = []

        @hard.score(@board, possible_moves, spot).should == 100
      end

      xit "should return a score of -1 if X is the winner" do
        @board.fill_space(0, "X")
        @board.fill_space(1, "X")
        @board.fill_space(2, "X")

        possible_moves = {}
        spot = []

        @hard.score(@board, possible_moves, spot).should == 0
      end

      xit "should return a score of 0 in any other case" do
        @board.fill_space(0, "X")
        @board.fill_space(1, "O")
        @board.fill_space(2, "X")

        possible_moves = {}
        spot = []

        @hard.score(@board, possible_moves, spot).should == 0
      end

      xit "should return a score of 0 when the board is empty" do
        @board == TicTacToeBoard.new(3)

        possible_moves = {}
        spot = []

        @hard.score(@board, possible_moves, spot).should == 0
      end
    end
  end
end