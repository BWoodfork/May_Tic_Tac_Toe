$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_board'
require 'ui'
require 'game_options'
require 'hard_ai'
require 'easy_ai'
require 'player'

ttt_board = TicTacToeBoard.new
ui = UI.new(ttt_board)
easy_ai = EasyAI.new(ttt_board)
hard_ai = HardAI.new(ttt_board)
player = Player.new
options = GameOptions.new(ui, ttt_board, player, easy_ai, hard_ai)

game = Game.new(ttt_board, ui, options, easy_ai, hard_ai)


game.run
