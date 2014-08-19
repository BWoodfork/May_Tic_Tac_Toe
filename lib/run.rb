$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'tic_tac_toe_rules'
require 'ui'
require 'game_options'
require 'hard_ai'
require 'easy_ai'
require 'player'

board = TicTacToeRules.new
ui = UI.new(board)
easy_ai = EasyAI.new(board)
hard_ai = HardAI.new(board)
player = Player.new
options = GameOptions.new(ui, board, player, easy_ai, hard_ai)

game = Game.new(board, ui, options, easy_ai, hard_ai)


game.run
