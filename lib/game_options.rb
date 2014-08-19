class GameOptions
  attr_reader :find_players

  def initialize(ui, tic_tac_toe_board, player, easy_ai, hard_ai)
    @find_players = []
    @ui = ui
    @ttt_board = tic_tac_toe_board
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
    else
      setup_players
    end
  end

  def get_game_difficulty
    difficulty_input = @ui.receive_difficulty

    if difficulty_input == @ui.easy_ai_message
      initiate_easy_game
    elsif difficulty_input == @ui.hard_ai_message
      initiate_hard_game
    else
      get_game_difficulty
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