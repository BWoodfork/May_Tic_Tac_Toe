require 'board'

describe Board do
  it "sets the number of spaces when initialized" do
    board = Board.new(9)
    board.size.should == 9

    board = Board.new(16)
    board.size.should == 16
  end

  context "filling and getting spaces" do
    let(:board) { Board.new(10) }

    it "fills a space with a string, given a valid location" do
      board.fill_space(1, 'x')
      board.get_space(1).should == 'x'
    end

    it "raises an exception if a space is already full" do
      board.fill_space(1, 'x')
      lambda {
        board.fill_space(1, 'o')
      }.should raise_error(Board::MoveError)
    end

    it "raises an exception if the space being filled doesn't exist" do
      lambda {
        board.fill_space(999, 'x')
      }.should raise_error(Board::MoveError)
      lambda {
        board.fill_space(-5, 'x')
      }.should raise_error(Board::MoveError)
    end
  end

  it "knows when it is full" do
    board = Board.new(1)
    board.fill_space(0, 'x')
    board.full?.should == true
  end

  it "knows when it isn't full" do
    board = Board.new(2)
    board.fill_space(0, 'x')
    board.full?.should == false
  end

  it "lists all the spaces" do
    board = Board.new(1)
    board.spaces.should == [nil]

    board = Board.new(4)
    board.fill_space(1, 'T')
    board.spaces.should == [nil, 'T', nil, nil]
  end
end
