$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'board'
require 'ui'
require 'board/presenter'
require 'player_factory'


board = TicTacToeBoard.new
ui = UI.new(io = Kernel, board)
game = Game.new(board, ui)
factory = PlayerFactory.new


factory.setup_players
game.run(factory)