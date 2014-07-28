class HardAI
  def initialize(board)
    @board = board
  end

  def make_move(board, player)
    move = minimax(board)
    @board.fill_space(move, @board.o_mark)
  end

  def minimax(board)
    possible_moves = Hash[check_empty_spaces(board).map { |spot, spot_score| [spot, nil] }]

    possible_moves.each do |spot, spot_score|
      fake_board = clone_board(board)
      fake_board.fill_space(spot, fake_board.token_that_is_up)
      if fake_board.game_over? 
        return spot
      end
    end
  end

  def check_empty_spaces(board)
    fake_board = clone_board(board).spaces

    fake_board.each_index.select do |spot|
      fake_board[spot] == nil
    end
  end

  def clone_board(board)
    board.clone
  end  
end