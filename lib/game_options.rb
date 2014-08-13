require 'player'
require 'easy_ai'
require 'hard_ai'

class GameOptions
  attr_reader :find_players

  def initialize(ui, board)
    @find_players = []
    @ui = ui
    @board = board
    @player = Player.new(@board.token_that_is_up)
    @player = Player.new(@board.token_that_is_up)
    @hard_ai = HardAI.new(@board.token_that_is_up)
    @easy_ai = EasyAI.new(@board.token_that_is_up)
  end

   def get_game_difficulty
    if @ui.receive_difficulty == "easy"
      initiate_easy_game
    elsif @ui.receive_difficulty == "hard"
      initiate_hard_game
    end
  end

  def initiate_easy_game
    @find_players << @player
    @find_players << @easy_ai
  end

  def initiate_hard_game
    @find_players << @player
    @find_players << @hard_ai
  end

  def initiate_human_game
    @find_players << @player
    @find_players << @player
  end

  def setup_players
    if @ui.receive_player_number == 1
      get_game_difficulty
    elsif @ui.receive_player_number == 2
      initiate_human_game
    end
  end
end