require 'player'
require 'easy_ai'

class PlayerFactory
  attr_reader :find_players

  def initialize(ui)
    @find_players = []
    @token_1 = "X"
    @token_2 = "O"
    @ui = ui
  end

  def setup_players
    @human_player1 = Player.new(@token_1)
    @human_player2 = Player.new(@token_2)
    @easy_ai = EasyAI.new(@token_2)

    if @ui.receive_player_number == 1
      @find_players << @human_player1
      @find_players << @easy_ai
    else
      @find_players << @human_player1
      @find_players << @human_player2
    end
  end
end