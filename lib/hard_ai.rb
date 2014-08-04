class HardAI
  attr_reader :token

  def initialize(board)
    @board = board
    @token = token
  end


  def get_empty_spaces(board)
    fake_board = clone_board(board).spaces

    fake_board.each_index.select do |spot|
      fake_board[spot] == nil
    end
  end

  def clone_board(board)
    Marshal.load(Marshal.dump(board))
  end
end