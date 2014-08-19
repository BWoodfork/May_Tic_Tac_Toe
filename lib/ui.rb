require 'board/presenter'

class UI
  def initialize(board)
    @board = board
  end

  def send_message(message)
    puts message
  end

  def receive_message
    gets.chomp
  end

  def ask_player_count
    send_message(ASK_PLAYER_COUNT)
  end

  def nobody_wins_message
    send_message(NOBODY_WINS)
  end

  def get_winning_player
    send_message "#{@board.winner} is the winner"
  end

  def receive_difficulty
    send_message(ASK_DIFFICULTY)
    receive_message
  end

  def receive_player_number
    ask_player_count
    receive_message.to_i
  end

  def wrong_number
    send_message("wrong number of players")
  end

  def print_board(board)
    send_message(Board::Presenter::Console.present(board))
  end

ASK_PLAYER_COUNT = "How player players? 1 or 2?"
ASK_DIFFICULTY = "What difficulty level? Easy or Hard?"
NOBODY_WINS = "Nobody wins this game"

end