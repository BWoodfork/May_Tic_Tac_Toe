require 'player'

class PlayerFactory
  attr_reader :find_players

  def initialize
    @find_players = []
    @token_1 = "X"
    @token_2 = "O"
  end

  def setup_players
    @human_player1 = Player.new(@token_1)
    @human_player2 = Player.new(@token_2)

    @find_players << @human_player1
    @find_players << @human_player2
  end
end