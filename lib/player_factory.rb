require 'player'
require 'easy_ai'

class PlayerFactory
  attr_reader :find_players

  def initialize(ui, board)
    @find_players = []
    @ui = ui
    @board = board
  end

  def setup_players
    @human_player1 = Player.new(@board.x_mark)
    @human_player2 = Player.new(@board.o_mark)
    @easy_ai = EasyAI.new(@board.o_mark)

    if @ui.receive_player_number == 1
      @find_players << @human_player1
      @find_players << @easy_ai
    else
      @find_players << @human_player1
      @find_players << @human_player2
    end
  end
end