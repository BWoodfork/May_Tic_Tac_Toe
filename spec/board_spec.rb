require 'board'

describe Board do
  it "has 9 spaces for a 3X3 board" do
    board = Board.new(3)
    board.size.should == 9
  end

  it "has 16 spaces for a 4X4 board" do
    board = Board.new(4)
    board.size.should == 16
  end

  it "has 9 spaces and is a 3X3 board by default" do
    board = Board.new
    board.size.should == 9
  end

  context "filling and getting spaces" do
    let(:board) { Board.new }

    it "fills a space with a string, given a valid location" do
      board.fill_space(1, 'x')
      board.get_space(1).should == 'x'
    end

    it "raises an exception if a space is already full" do
      board.fill_space(1, 'x')
      lambda {
        board.fill_space(1, 'o')
      }.should raise_error(Board::FullSpace)
    end

    it "raises an exception if the space being filled doesn't exist" do
      lambda {
        board.fill_space(999, 'x')
      }.should raise_error(Board::InvalidSpace)
      lambda {
        board.fill_space(-5, 'x')
      }.should raise_error(Board::InvalidSpace)
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
end