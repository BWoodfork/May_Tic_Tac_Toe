class Game
  attr_reader :turns_taken

  def initialize(board, ui, options, easy_ai, hard_ai)
    @board = board
    @ui = ui
    @options = options
    @easy_ai = easy_ai
    @hard_ai = hard_ai
    @turns_taken = 0
  end

  def run
    @options.setup_players

    while !@board.game_over?
      @ui.print_board(@board)
      begin
        make_move
        take_turn
      rescue Board::MoveError => error
        @ui.send_message error.message
      end
    end

    @ui.print_board(@board)
    
    @board.tie_game? ? @ui.nobody_wins_message : @ui.get_winning_player
  end

  def current_player
    @options.find_players[player_that_is_up]
  end

  def take_turn
    @turns_taken += 1
  end
  
  def make_move
    if current_player.class == Player
      move = @ui.receive_message.to_i
      @board.fill_space(move, @board.token_that_is_up)
    elsif current_player.class == EasyAI
      @easy_ai.make_move
    elsif current_player.class == HardAI
      @hard_ai.make_move
    end
  end

  private

  def player_that_is_up
    @turns_taken.even? ? 0 : 1
  end
end
