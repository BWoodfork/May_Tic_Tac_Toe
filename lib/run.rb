$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'game'
require 'board'
require 'ui'
require 'board/presenter'


board = TicTacToeBoard.new
ui = UI.new(io = Kernel, board)
game = Game.new(board, ui)

game.run(PlayerFactory.new)