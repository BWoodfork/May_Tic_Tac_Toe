class Game
  attr_reader :turns_taken

  def initialize(board, ui, factory)
    @board = board
    @ui = ui
    @factory = factory
    @turns_taken = 0
  end

  def run
    @factory.setup_players

    while !@board.game_over?
      @ui.print_board(@board)
      make_move
      take_turn
    end

    @ui.print_board(@board)

    if @board.winner.nil?
      @ui.send_message "Nobody wins this game"
    else
      @ui.send_message "#{@board.winner} is the winner"
    end
  end

  def current_player
    @factory.find_players[player_that_is_up]
  end

  def take_turn
    @turns_taken += 1
  end

  private

  def make_move
    move = @ui.receive_message.to_i
    @board.fill_space(move, current_player.token)
  end

  def player_that_is_up
    @turns_taken.even? ? 0 : 1
  end
end
