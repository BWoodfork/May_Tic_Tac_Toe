$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_board'
require 'ui'
require 'player_factory'

board = TicTacToeBoard.new
ui = UI.new
factory = PlayerFactory.new(ui)
easy_ai = EasyAI.new(board)
game = Game.new(board, ui, factory, easy_ai)


game.run
