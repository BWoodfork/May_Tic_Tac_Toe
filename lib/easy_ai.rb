class EasyAI
  attr_reader :token
  def initialize(board)
    @board = board
    @token = token
  end

  def get_spot_number
    @board.spaces.find_index { |space| space.nil? }
  end

  def pick_a_spot
    move = get_spot_number
    make_move(move)
  end

  def make_move(move)
    @board.fill_space(move, @token)
  end
end