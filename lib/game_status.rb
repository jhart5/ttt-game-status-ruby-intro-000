# Helper Method
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
  WIN_COMBINATIONS.each do |combination|
    if combination.all? {|index| board[index] == "X"}
      return combination
    elsif combination.all? {|index| board[index] == "O"}
      return combination
    else
      false
    end
  end
  false
end

def full?(board)
  board.all? do |location|
    if ((location == "X") || (location == "O"))
      true
    else
      false
    end
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  (((full?(board)) || (won?(board))) || (draw?(board)))
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
