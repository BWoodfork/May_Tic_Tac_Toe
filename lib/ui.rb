require 'tic_tac_toe_board'
require 'board'

class UI

  attr_reader :io

  def initialize(io = Kernel, board)
    @io = io
    @board = board
  end

  def send_message(message)
    @io.puts message
  end

  def receive_message
    gets.chomp
  end

  def get_move(board)
    gets.chomp
  end
end