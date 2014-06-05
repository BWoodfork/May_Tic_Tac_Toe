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

    context "prints space separators for boards that have more than one space" do
      it "for 2X2 boards" do
        board = Board.new(4)
        Board::Presenter::Console.present(board).should == " | \n---\n | \n"
      end

      it "for 3X3 boards" do
        board = Board.new(9)
        Board::Presenter::Console.present(board).should == " | | \n-----\n | | \n-----\n | | \n"
      end
    end
  end
end
