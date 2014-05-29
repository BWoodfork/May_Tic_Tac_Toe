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

      private

      def self.spot_separator(spot, index, size)
        length = Math.sqrt(size).to_i

        if (index + 1) == size
          "\n"
        elsif (index + 1) % length == 0
          "\n---\n"
        else
          "|"
        end
      end

      def self.spot_to_string(spot)
        spot || " "
      end
    end
  end
end