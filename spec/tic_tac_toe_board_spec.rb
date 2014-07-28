require 'tic_tac_toe_board'

describe TicTacToeBoard do
  it "has 9 spaces for a 3X3 board" do
    board = TicTacToeBoard.new(3)
    board.size.should == 9
  end

  it "has 16 spaces for a 4X4 board" do
    board = TicTacToeBoard.new(4)
    board.size.should == 16
  end

  it "has 9 spaces and is a 3X3 board by default" do
    board = TicTacToeBoard.new
    board.size.should == 9
  end

  context "knows if the game is over" do
    it "is over when the board is full" do
      board = TicTacToeBoard.new(1)
      board.fill_space(0, 'X')
      board.game_over?.should == true
    end

    it "is over when the same board piece occupies a row of spaces" do
      board = TicTacToeBoard.new(3)
      board.fill_space(0, 'X')
      board.fill_space(1, 'X')
      board.fill_space(2, 'X')
      board.game_over?.should == true

      board = TicTacToeBoard.new(3)
      board.fill_space(0, 'O')
      board.fill_space(1, 'O')
      board.fill_space(2, 'O')
      board.game_over?.should == true

      board = TicTacToeBoard.new(2)
      board.fill_space(0, 'X')
      board.fill_space(1, 'X')
      board.game_over?.should == true
    end

    it "is over when the same board piece occupies a column of spaces" do
      board = TicTacToeBoard.new(3)
      board.fill_space(0, 'X')
      board.fill_space(3, 'X')
      board.fill_space(6, 'X')
      board.game_over?.should == true

      board = TicTacToeBoard.new(3)
      board.fill_space(0, 'O')
      board.fill_space(3, 'O')
      board.fill_space(6, 'O')
      board.game_over?.should == true
    end

    it "is over when the same board piece occupies a diagonal line" do
      board = TicTacToeBoard.new(3)
      board.fill_space(0, 'X')
      board.fill_space(4, 'X')
      board.fill_space(8, 'X')
      board.game_over?.should == true

      board = TicTacToeBoard.new(3)
      board.fill_space(2, 'O')
      board.fill_space(4, 'O')
      board.fill_space(6, 'O')
      board.game_over?.should == true
    end

    it "isn't over in all other cases" do
      board = TicTacToeBoard.new(1)
      board.game_over?.should == false
    end
  end

  it "finds the correct winner" do
    board = TicTacToeBoard.new
    board.fill_space(0, 'X')
    board.fill_space(4, 'X')
    board.fill_space(8, 'X')
    board.winner.should == 'X'

    board = TicTacToeBoard.new
    board.fill_space(0, 'O')
    board.fill_space(1, 'O')
    board.fill_space(2, 'O')
    board.winner.should == 'O'

    board = TicTacToeBoard.new
    board.winner.should == nil
  end

  context "fills the space with a valid piece" do
    let(:board) {TicTacToeBoard.new}

    it "X is a valid piece" do
      board.fill_space(0, 'X')
      board.get_space(0).should == 'X'
    end

    it "O is a valid piece" do
      board.fill_space(0, 'O')
      board.get_space(0).should == 'O'
    end

    it "everything else is an invalid piece" do
      lambda {
        board.fill_space(0, 'Y')
      }.should raise_error(TicTacToeBoard::InvalidPiece)
    end
  end

  context "Determine next player" do
    let(:board) { TicTacToeBoard.new }
    it "return X if it is X's turn" do
      board.token_that_is_up.should == "X"
    end

    it "return O if it is O's turn" do
      board.fill_space(0, "X")
      board.token_that_is_up.should == "O"
    end

    it "should return X if it is not X's turn" do
      board.fill_space(0, "X")

      board.opponent_token.should == "X"
    end
  end
end
