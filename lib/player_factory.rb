require 'player'
require 'easy_ai'
require 'hard_ai'

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
    @easy_ai = HardAI.new(@board.o_mark)

    if @ui.receive_player_number == 1
      @find_players << @human_player1
      @find_players << @easy_ai
    else
      @find_players << @human_player1
      @find_players << @human_player2
    end
  end

  # def get_number_of_players
  #   if @ui.receive_player_number == 1
  #     if @ui.receive_difficulty == "Hard"
  #       setup_hard_ai_game
  #     elsif @ui.receive_difficulty == "Easy"
  #       setup_easy_ai_game
  #     end
  #   elsif @ui.receive_player_number == 2
  #     setup_two_human_game
  #   end
  # end

  # def setup_two_human_game
  #   @find_players << Player.new(@board.x_mark)
  #   @find_players << Player.new(@board.o_mark)
  # end

  # def setup_easy_ai_game
  #   @find_players << Player.new(@board.x_mark)
  #   @find_players << EasyAI.new(@board.o_mark)
  # end

  # def setup_hard_ai_game
  #   @find_players << Player.new(@board.x_mark)
  #   @find_players << HardAI.new(@board.o_mark)
  # end
end