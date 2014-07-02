class Board
  class MoveError < Exception ; end

  attr_reader :size
  attr_accessor :board_state

  def initialize(size)
    @size = size
    @board_state = Array.new(@size)
  end

  def fill_space(space_number, token)
    validate_move(space_number)
    @board_state[space_number] = token
  end

  def get_space(space_number)
    @board_state[space_number]
  end

  def full?
    @board_state.compact.size == @size
  end

  def spaces
    @board_state
  end

  private

  def validate_move(space_number)
      raise MoveError.new("Space is Invalid!") if space_number >= @size
      raise MoveError.new("Space is Invalid!") if space_number < 0
      raise MoveError.new("Space is Full Bro!") unless @board_state[space_number].nil?
  end
end
