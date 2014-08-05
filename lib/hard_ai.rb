class HardAI
  def initialize(board)
    @board = board
  end

  def make_move(board)
    fake_board = duplicate_board(board)
    move = minimax(fake_board)

    @board.fill_space(move, @board.o_mark)
  end

  def minimax(fake_board, depth = 0, scores = {})

    get_empty_spaces(fake_board).each do |space|
      fake_board.fill_space(space, fake_board.token_that_is_up)
        scores[space] = score_board_state(fake_board)
        minimax(fake_board, depth + 1)
        fake_board.spaces[space] = nil
    end

    if fake_board.token_that_is_up == fake_board.o_mark
      top = scores.values.max
      return scores.key(top)
    elsif fake_board.token_that_is_up == fake_board.x_mark
      low = scores.values.min
      return scores.key(low)
    end
  end

  def score_board_state(fake_board)
    if fake_board.winner == fake_board.o_mark
      10
    elsif fake_board.winner == fake_board.x_mark
      -10
    else
      0
    end
  end

  def get_empty_spaces(board)
    board_spaces = duplicate_board(board).spaces
    empty_board_spots = []

    board_spaces.each_with_index do |space, index|
      if space.nil?
        empty_board_spots << index
      end
    end
    
    empty_board_spots
  end

  def duplicate_board(board)
    Marshal.load(Marshal.dump(board))
  end
end