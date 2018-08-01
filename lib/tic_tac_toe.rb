WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def move(board, index, current_player = "X")
  board[index] = current_player
end


def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  count = 0 
  board.each do |item|
    if item == "O" || item == "X"  
      count +=1 
    end 
  end 
  return count 
end


def current_player(board)
  if turn_count(board).odd?
    return "O"
  end 
  return "X"
end 

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == "X"}
      return win_combo
    end
    if win_combo.all? {|index| board[index] == "O"}
      return win_combo
    end 
  end
  
  # Reached here => no winning combination detected
  return false
end


def full?(board)
  board.all? { |item | item == "X" || item == "O"}
end


def draw?(board)
  if won?(board)
    return false 
  elsif !full?(board)
    return false 
  else
    return true
  end 
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true 
  end 
  return false 
end 

