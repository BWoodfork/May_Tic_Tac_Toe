require 'board/presenter'

class UI
  def send_message(message)
    puts message
  end

  def receive_message
    gets.chomp
  end

  def get_player_count
    send_message("How many players? 1 or 2?")
  end

  def receive_player_number
    get_player_count
    receive_message.to_i
  end

  def print_board(board)
    send_message(Board::Presenter::Console.present(board))
  end
end