class HardAI
  def initialize(board)
    @board = board
  end

  def make_move(board)
    fake_board = @board.duplicate_board(board)
    move = minimax(fake_board)

    @board.fill_space(move, @board.o_mark)
  end

  def minimax(fake_board, depth = 0, scores = {})
    return 0 if fake_board.tie_game?
    return -1 if fake_board.game_over?

    fake_board.get_empty_spaces(fake_board).each do |space|
      fake_board.fill_space(space, fake_board.token_that_is_up)
        scores[space] = -1 * minimax(fake_board, depth + 1, {})
        fake_board.spaces[space] = nil
    end

    best_space = scores.max_by { |key, value| value }[0]
    best_scored_space = scores.max_by { |key, value| value }[1]
    
    depth == 0 ? best_space : best_scored_space
  end
end