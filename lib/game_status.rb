# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = 
[
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
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    all_O = [position_1, position_2, position_3].all? do | element |
      element == "O"
    end
    all_X = [position_1, position_2, position_3].all? do | element |
          element == "X"
    end
    if all_O || all_X
      return win_combination
    end
    
    #if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1== "O" && position_2 == "O" && position_3 == "O")
    #  return win_combination
    # end
  end
  # return false if no winning combination found
  return false
end

def full?(board)
  return board.all? {| element | element == "X" || element == "O"}
end

def draw?(board)
  #if (!won?(board)) && full?(board)
  #  return true
  #elsif
  if (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  (won?(board) || draw?(board))? true : false
end

def winner(board)
  won?(board)? board[(won?(board))[0]] : nil
end
