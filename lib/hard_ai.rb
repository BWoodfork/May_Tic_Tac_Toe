class HardAI
  def initialize(board)
    @board = board
    @token = "O"
  end

  def generate_board(board)
    board.spaces.clone
  end  

  def score
    if @board.winner == "O"
     100
    elsif @board.winner == "X"
     50
    else
     0
    end
  end
end