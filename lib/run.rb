$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_board'
require 'ui'
require 'player_factory'
require 'hard_ai'

board = TicTacToeBoard.new
ui = UI.new
factory = PlayerFactory.new(ui, board)
easy_ai = HardAI.new(board)
hard_ai = HardAI.new(board)

game = Game.new(board, ui, factory, easy_ai)


game.run
