require 'board'

class TicTacToeBoard < Board
  class InvalidPiece < Exception ; end

  attr_reader :x_mark, :o_mark

  VALID_PIECES = ['X', 'O'].freeze

  def initialize(length = 3)
    @length = length
    super(length * length)
    @x_mark = "X"
    @o_mark = "O"
  end

  def game_over?
    full? || !row_winner.nil? ||
    !column_winner.nil? || !diagonal_winner.nil?
  end

  def winner
    row_winner || column_winner || diagonal_winner
  end

  def tie_game?
    if game_over? && winner.nil?
      true
    end
  end

  def full?
    @board_state.compact.size == @size
  end

  def fill_space(space_number, token)
    validate_piece(token)
    super(space_number, token)
  end

  def get_empty_spaces(board)
    board_spaces = @board_state
    empty_board_spots = []

    board_spaces.each_with_index do |space, index|
      if space.nil?
        empty_board_spots << index
      end
    end
    empty_board_spots
  end

  def token_that_is_up
    if spaces.compact.size.even?
      @x_mark
    else
      @o_mark
    end
  end

  private

  def validate_piece(token)
    raise InvalidPiece.new unless VALID_PIECES.any? {|valid_piece| valid_piece == token}
  end

  def row_winner
    rows.each do |row|
      VALID_PIECES.each do |valid_piece|
        return valid_piece if all_spaces_filled_by_same_piece?(row, valid_piece)
      end
    end
    nil
  end

  def column_winner
    columns.each do |column|
      VALID_PIECES.each do |valid_piece|
        return valid_piece if all_spaces_filled_by_same_piece?(column, valid_piece)
      end
    end
    nil
  end

  def diagonal_winner
    diagonals.each do |diagonal|
      VALID_PIECES.each do |valid_piece|
        return valid_piece if all_spaces_filled_by_same_piece?(diagonal, valid_piece)
      end
    end
    nil
  end

  def rows
    rows = []
    @board_state.each_slice(@length) do |slice|
      rows << slice
    end
    rows
  end

  def columns
    columns = Array.new(@length)
    columns.map! {|index| Array.new}

    @board_state.each_with_index do |space, space_number|
      column_number = space_number % @length
      columns[column_number] << space
    end
    columns
  end

  def diagonals
    left_to_right = []
    right_to_left = []

    @board_state.each_with_index do |space, space_number|
      if space_number == 0
        left_to_right << space
      elsif space_number == @size - 1
        left_to_right << space
      else
        left_to_right << space if space_number % (@length + 1) == 0
        right_to_left << space if space_number % (@length - 1) == 0
      end
    end

    [left_to_right, right_to_left]
  end

  def all_spaces_filled_by_same_piece?(spaces, piece)
    return false if spaces.first.nil?
    spaces.all? {|space| space == piece}
  end
end
