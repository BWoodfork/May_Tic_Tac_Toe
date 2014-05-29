require 'board'
require 'board/presenter'

describe Board::Presenter::Console do
  context "converts the board to a string" do
    it "prints the space and a newline for a board with a length of 1" do
      board = Board.new(1)
      Board::Presenter::Console.present(board).should == " \n"

      board.fill_space(0, 'x')
      Board::Presenter::Console.present(board).should == "x\n"
    end

    it "prints space separators for boards that have more than one space" do
      board = Board.new(2)
      Board::Presenter::Console.present(board).should == " | \n---\n | \n"
    end
  end
end