class BoardHelper
  def initialize(board)
    @board = board
  end

  def string_to_board(string_board)
    rows = string_board.split(",")

    @board.content.size.times do |index_row|
      @board.content.size.times do |index_column|
        if rows[index_row].chars[index_column] == Mark::CROSS
          @board.content[index_row][index_column] = Mark::CROSS
        elsif rows[index_row].chars[index_column] == Mark::ROUND
          @board.content[index_row][index_column] = Mark::ROUND
        end
      end
    end
  end

  def board_to_string
    board_string = ""

    @board.content.flatten.each.with_index do |value, index|
      if !value.is_a?(Integer)
        board_string << value
      else
        board_string << " "
      end

      index += 1
      if  board_edge?(index) && index != @board.POSITION_MAX
        board_string << ","
      end

    end

    board_string
  end

  def board_edge?(index)
    index % @board.content.size == 0
  end
end
