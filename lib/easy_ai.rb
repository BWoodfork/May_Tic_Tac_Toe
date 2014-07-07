class EasyAI
  def initialize(board)
    @board = board
    @token = "O"
  end

  def get_spot_number
    @board.spaces.find_index { |space| space.nil? }
  end

  def pick_a_spot
    move = get_spot_number
    @board.fill_space(move, @token)
  end
end