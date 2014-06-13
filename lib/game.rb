class Game
  def initialize(board, ui)
    @board = board
    @turns_taken = 0
    @ui = ui
  end

  def run(factory)
    while !@board.game_over?
      @ui.print_board(@board)
      make_move(factory)
      take_turn
    end
      @ui.print_board(@board)
  end

  def current_player(factory)
    factory.find_players[player_that_is_up]
  end

  def take_turn
    @turns_taken += 1
  end

  private

  def make_move(factory)
    move = @ui.receive_message.to_i
    @board.fill_space(move, current_player(factory).token)
  end

  def player_that_is_up
    @turns_taken.even? ? 0 : 1
  end
end
