class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2] # right_diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char)
      @board[position] = char
  end

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
      number_of_turns = 0
      @board.each do |space|
      if space == "X" || space == "O"
          number_of_turns += 1
      end
    end
    return number_of_turns

  #current_player
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end
  #turn
  def turn
   puts "Please enter 1-9:"
   input = gets.strip
   if valid_move?(input)
     move(input, current_player)
   else
     turn
   end
   display_board
    end
   end
  end
 end
end
