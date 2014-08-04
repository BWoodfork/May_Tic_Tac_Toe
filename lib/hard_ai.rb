class HardAI
  def initialize(board)
    @board = board
  end

  def make_move(board)
    fake_board = duplicate_board(fake_board)
  end

  def minimax(fake_board, depth = 0, scores = {})
    get_empty_spaces(fake_board).each do |space|
      fake_board.fill_space(space, fake_board.token_that_is_up)
        if fake_board.game_over?
          scores[space] = score_board_state(fake_board)
          scores
        else
          minimax(fake_board, depth + 1)
          fake_board.delete_space(space)
        end
    end
  end

  def score_board_state(board)
    if board.winner == board.o_mark
      10
    elsif board.winner == board.x_mark
      -10
    elsif board.tie_game?
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