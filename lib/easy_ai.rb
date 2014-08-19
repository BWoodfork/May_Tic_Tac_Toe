class EasyAI
  def initialize(tic_tac_toe_board)
    @ttt_board = tic_tac_toe_board
  end

  def get_spot_number
    @ttt_board.spaces.find_index { |space| space.nil? }
  end

  def make_move
    move = get_spot_number

    @ttt_board.fill_space(move, @ttt_board.token_that_is_up)
  end
end