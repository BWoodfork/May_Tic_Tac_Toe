class HardAI
  def initialize(board)
    @board = board
  end

  def make_move
  end

  def minimax(board)
    # possible_moves = Hash[check_empty_spaces(board).map { |spot, spot_score| [spot, nil] }]
    fake_board = clone_board(board)
    empty_spots = check_empty_spaces(board)
    best_score = {}

    empty_spots.each do |space|
      fake_board.fill_space(space, fake_board.token_that_is_up)
        if fake_board.winner == fake_board.token_that_is_up
          best_score[space] = 100
        elsif fake_board.tie_game?
          best_score[space] = 50
        elsif fake_board.winner == fake_board.opponent_token
          best_score[space] = 0
        end
    end

    number = best_score.values.max
    best_score.key(number)

    # if fake_board.token_that_is_up == fake_board.o_mark
    #   number = best_score.values.max
    #   best_score.key(number)
    # elsif fake_board.token_that_is_up == fake_board.x_mark
    #   number = best_score.values.min
    #   best_score.key(number)
    # end

  end

  def score_move(board)
    if board.winner == board.o_mark
      100
    elsif board.winner == board.x_mark
      0
    else
      50
    end
  end

  def check_empty_spaces(board)
    fake_board = clone_board(board).spaces

    fake_board.each_index.select do |spot|
      fake_board[spot] == nil
    end
  end

  def clone_board(board)
    Marshal.load(Marshal.dump(board))
  end
end