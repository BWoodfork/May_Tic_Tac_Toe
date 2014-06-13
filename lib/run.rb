$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_board'
require 'ui'
require 'player_factory'


board = TicTacToeBoard.new
ui = UI.new
game = Game.new(board, ui)
factory = PlayerFactory.new


factory.setup_players
game.run(factory)
