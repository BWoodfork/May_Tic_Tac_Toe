class EasyAI
  def initialize(board)
    @board = board
  end

  def pick_a_spot
     puts "this is the #{@board.inspect}"
     @board.find_index { |space| space.nil? }
  end
end