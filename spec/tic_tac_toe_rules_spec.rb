require 'tic_tac_toe_rules'

describe TicTacToeRules do
  before(:each) do
    @board = TicTacToeRules.new
  end
  
  it "has 9 spaces for a 3X3 board" do
    @board = TicTacToeRules.new(3)
    @board.size.should == 9
  end

  it "has 16 spaces for a 4X4 board" do
    @board = TicTacToeRules.new(4)
    @board.size.should == 16
  end

  it "has 9 spaces and is a 3X3 board by default" do
    @board = TicTacToeRules.new
    @board.size.should == 9
  end

  context "knows if the game is over" do
    it "is over when the board is full" do
      @board = TicTacToeRules.new(1)
      @board.fill_space(0, 'X')
      @board.game_over?.should == true
    end

    it "is over when there is a tie" do
      @board = TicTacToeRules.new(3)
      @board.fill_space(0, "X")
      @board.fill_space(1, 'O')
      @board.fill_space(2, 'X')
      @board.fill_space(3, 'X')
      @board.fill_space(4, 'O')
      @board.fill_space(5, 'O')
      @board.fill_space(6, 'O')
      @board.fill_space(7, 'X')
      @board.fill_space(8, 'X')

      @board.tie_game?.should == true
    end

    it "is over when the same board piece occupies a row of spaces" do
      @board = TicTacToeRules.new(3)
      @board.fill_space(0, 'X')
      @board.fill_space(1, 'X')
      @board.fill_space(2, 'X')
      @board.game_over?.should == true

      @board = TicTacToeRules.new(3)
      @board.fill_space(0, 'O')
      @board.fill_space(1, 'O')
      @board.fill_space(2, 'O')
      @board.game_over?.should == true

      @board = TicTacToeRules.new(2)
      @board.fill_space(0, 'X')
      @board.fill_space(1, 'X')
      @board.game_over?.should == true
    end

    it "is over when the same board piece occupies a column of spaces" do
      @board = TicTacToeRules.new(3)
      @board.fill_space(0, 'X')
      @board.fill_space(3, 'X')
      @board.fill_space(6, 'X')
      @board.game_over?.should == true

      @board = TicTacToeRules.new(3)
      @board.fill_space(0, 'O')
      @board.fill_space(3, 'O')
      @board.fill_space(6, 'O')
      @board.game_over?.should == true
    end

    it "is over when the same board piece occupies a diagonal line" do
      @board = TicTacToeRules.new(3)
      @board.fill_space(0, 'X')
      @board.fill_space(4, 'X')
      @board.fill_space(8, 'X')
      @board.game_over?.should == true

      @board = TicTacToeRules.new(3)
      @board.fill_space(2, 'O')
      @board.fill_space(4, 'O')
      @board.fill_space(6, 'O')
      @board.game_over?.should == true
    end

    it "isn't over in all other cases" do
      @board = TicTacToeRules.new(1)
      @board.game_over?.should == false
    end

    it "knows when the board is full" do
      @board = TicTacToeRules.new(1)
      @board.fill_space(0, 'X')
      @board.full?.should == true
    end

    it "knows when it isn't full" do
      @board = TicTacToeRules.new(2)
      @board.fill_space(0, 'X')
      @board.full?.should == false
    end
  end

  it "finds the correct winner" do
    @board = TicTacToeRules.new
    @board.fill_space(0, 'X')
    @board.fill_space(4, 'X')
    @board.fill_space(8, 'X')
    @board.winner.should == 'X'

    @board = TicTacToeRules.new
    @board.fill_space(0, 'O')
    @board.fill_space(1, 'O')
    @board.fill_space(2, 'O')
    @board.winner.should == 'O'

    @board = TicTacToeRules.new
    @board.winner.should == nil
  end

  context "fills the space with a valid piece" do
    it "X is a valid piece" do
      @board.fill_space(0, 'X')
      @board.get_space(0).should == 'X'
    end

    it "O is a valid piece" do
      @board.fill_space(0, 'O')
      @board.get_space(0).should == 'O'
    end

    it "everything else is an invalid piece" do
      lambda {
        @board.fill_space(0, 'Y')
      }.should raise_error(TicTacToeRules::InvalidPiece)
    end
  end

  context "Determine next player" do
    it "return X if it is X's turn" do
      @board.token_that_is_up.should == "X"
    end

    it "return O if it is O's turn" do
      @board.fill_space(0, "X")
      @board.token_that_is_up.should == "O"
    end

    it "should return X if it is not X's turn" do
      @board.fill_space(0, "X")

      @board.opponent_token.should == "X"
    end
  end

  context "#duplicate board" do
    it "should generate a duplicate of the board" do
      @board.duplicate_board(@board).object_id.should_not == @board.object_id
    end
  end

   context "return empty spaces" do
    it "should return empty spaces" do
      @board.fill_space(0, "X")
      @board.fill_space(1, "X")
      @board.fill_space(2, "X")

      @board.fill_space(3, "X")
      @board.fill_space(4, "X")
      @board.fill_space(5, "X")

      @board.fill_space(6, "X")
      @board.fill_space(7, "X")


      @board.get_empty_spaces(@board).should == [8]
    end
  end
end
