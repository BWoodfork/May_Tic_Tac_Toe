class GameOptions
  attr_reader :find_players

  def initialize(ui, board, player, easy_ai, hard_ai)
    @find_players = []
    @ui = ui
    @board = board
    @player = player
    @easy_ai = easy_ai
    @hard_ai = hard_ai
  end

  def setup_players
    player_number_input = @ui.receive_player_number

    if player_number_input == 1
      get_game_difficulty
    elsif player_number_input == 2
      initiate_human_game
    end
  end

  def get_game_difficulty
    difficulty_input = @ui.receive_difficulty

    if difficulty_input == "easy"
      initiate_easy_game
    elsif difficulty_input == "hard"
      initiate_hard_game
    end
  end

  private

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
end