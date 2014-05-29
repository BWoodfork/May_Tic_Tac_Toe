class Board
  class FullSpace < Exception ; end
  class InvalidSpace < Exception ; end

  attr_reader :size

  def initialize(length = 3)
    @size = length * length
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
    raise InvalidSpace.new if space_number >= @size
    raise InvalidSpace.new if space_number < 0
    raise FullSpace.new unless @board_state[space_number].nil?
  end
end
