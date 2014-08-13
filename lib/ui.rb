require 'board/presenter'

class UI
  def send_message(message)
    puts message
  end

  def receive_message
    gets.chomp
  end

  def ask_player_count
    send_message("How many players? 1 or 2?")
  end

  def nobody_wins_message
    send_message("Nobody Wins This Game")
  end

  def get_winning_player(token)
    send_message("#{token.winner} is the winner")
  end

  def receive_difficulty
    ask_difficulty
    receive_message
  end

  def ask_difficulty
    send_message("What difficulty level? Easy or Hard?")
  end

  def receive_player_number
    ask_player_count
    receive_message.to_i
  end

  def print_board(board)
    send_message(Board::Presenter::Console.present(board))
  end
end