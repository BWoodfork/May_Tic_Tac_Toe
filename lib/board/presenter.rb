class Board
  module Presenter
    module Console
      def self.present(board)
        string = ""

        board.spaces.each_with_index do |spot, index|
          string << spot_to_string(spot)
          string << spot_separator(spot, index, board.size)
        end

        string
      end

      def self.spot_separator(spot, index, size)
        length = Math.sqrt(size).to_i

        if end_of_board?(index, size)
          "\n"
        elsif should_print_new_line?(index, length)
          my_string = "\n"
          my_string += "-" * (length * 2 - 1)
          my_string += "\n"
          my_string
        else
          "|"
        end
      end
      private_class_method :spot_separator

      def self.end_of_board?(index, size)
        (index + 1) == size
      end
      private_class_method :end_of_board?

      def self.should_print_new_line?(index, length)
        (index + 1) % length == 0
      end
      private_class_method :should_print_new_line?

      def self.spot_to_string(spot)
        spot || " "
      end

      def self.print_board(board)
        puts present(board)
      end

      private_class_method :spot_to_string
    end
  end
end
