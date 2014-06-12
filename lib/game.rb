require 'tic_tac_toe_board'
require 'player_factory'
require 'board/presenter'
require 'ui'
require 'player_factory'

class Game
  def initialize(board, ui)
    @board = board
    @turns_taken = 0
    @ui = ui
  end

  def run(factory)
    factory.setup_players
    while !@board.game_over?
      puts Board::Presenter::Console.present(@board)
      move = @ui.get_move(@board).to_i
      @board.fill_space(move, current_player(factory).token)
      take_turn
    end
  end

  def current_player(factory)
    factory.find_players[player_that_is_up]
  end

  def take_turn
    @turns_taken += 1
  end

  private

  def player_that_is_up
    @turns_taken.even? ? 0 : 1
  end
end