require 'board/presenter'

class UI
  def send_message(message)
    puts message
  end

  def receive_message
    gets.chomp
  end

  def print_board(board)
    send_message(Board::Presenter::Console.present(board))
  end
end
