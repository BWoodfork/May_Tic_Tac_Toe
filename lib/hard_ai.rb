class HardAI
  
  def initialize(tic_tac_toe_board)
    @ttt_board = tic_tac_toe_board
  end

  def make_move
    board = @ttt_board
    move = minimax(board)

    @ttt_board.fill_space(move, @ttt_board.o_mark)
  end

  def minimax(board, depth = 0, scores = {})
    return 0 if board.tie_game?
    return -1 if board.game_over?

    board.get_empty_spaces(board).each do |space|
      board.fill_space(space, board.token_that_is_up)
        scores[space] = -1 * minimax(board, depth + 1, {})
        board.spaces[space] = nil
    end

    best_space = scores.max_by { |space, score| score }[0]
    best_scored_space = scores.max_by { |space, score| score }[1]
    
    depth == 0 ? best_space : best_scored_space
  end
end