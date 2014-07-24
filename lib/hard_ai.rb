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
    possible_moves = Hash[check_empty_spaces(board).map { |spot, spot_score| [spot, nil] }]

      if game.current_player.class == HardAI
        possible_moves.each do |spot, spot_score|
          fake_board = clone_board(board)
          fake_board.fill_space(spot, @token)
          score(board, possible_moves, spot)
        end

        best_move = possible_moves.values.max
        return possible_moves.key[best_move]
      
      elsif game.current_player.class == Player
        possible_moves.each do |spot, spot_score|
          fake_board = clone_board(board)
          fake_board.fill_space(spot, @token)
          score(board, possible_moves, spot)
        end

        worst_move = possible_moves.values.min
        return possible_moves.key[worst_move]
      end

       return minimax(board) if !board.game_over?
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



  # available_spaces = check_empty_spaces(board)
  #   available_spaces.each do |space|
  #     fake_board = clone_board(board)
  #     fake_board.fill_space(space, @token)
  #     score(board)
  #   end




  def check_empty_spaces(board)
    fake_board = clone_board(board).spaces

    fake_board.each_with_index do |space, index|
      if space.nil?
        return [index]
      end
    end
  end

  def clone_board(board)
    board.clone
  end  
end