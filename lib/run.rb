$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_board'
require 'ui'
require 'player_factory'


board = TicTacToeBoard.new
ui = UI.new
factory = PlayerFactory.new
game = Game.new(board, ui, factory)


game.run
