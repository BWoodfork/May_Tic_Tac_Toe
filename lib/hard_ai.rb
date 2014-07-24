class HardAI
  def initialize(board)
    @board = board
    @token = "O"
  end

  def make_move(board)
    move = minimax(board)
    @board.fill_space(move, @token)
  end

  def minimax(board)
    puts "this is check empty #{check_empty_spaces(board)}"
    possible_moves = Hash[check_empty_spaces(board).map { |spot, spot_score| [spot, nil] }]
    puts "#{possible_moves}"

        possible_moves.each do |spot, spot_score|
          fake_board = clone_board(board)
          fake_board.fill_space(spot, @token)
          if board.game_over?
            return spot
          else
            score(fake_board, possible_moves, spot)
            spot_number = possible_moves.values.max
            best_move = possible_moves.key(spot_number)
            return best_move
          end
        end
  end

 def score(board, possible_moves, spot)
   if board.winner == "O"
      possible_moves[spot] = 100
   elsif board.winner == "X"
      possible_moves[spot] = 0
   elsif board.full?
      possible_moves[spot] = 50
   else
      possible_moves[spot] = 0
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