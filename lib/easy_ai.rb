class EasyAI
  def initialize(board)
    @board = board
  end

  def get_spot_number
    @board.spaces.find_index { |space| space.nil? }
  end

  def make_move
    move = get_spot_number

    @board.fill_space(move, @board.token_that_is_up)
  end
end