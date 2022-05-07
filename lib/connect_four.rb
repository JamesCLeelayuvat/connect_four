class Connect_four
  attr_accessor :board

  def initialize
    create_board
  end

  def create_board
    @board = [[nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]
  end


  def show_board
    visual_board = ""
    i = 5
    while i >= 0
      (@board.size).times do |j|
        case @board[j][i]
        when 1
          visual_board = visual_board + "🔵"
        when 2
          visual_board = visual_board + "🔴"
        else
          visual_board = visual_board + "⚪"
        end
      end
      visual_board = visual_board + "\n"
      i -= 1
    end
    visual_board
  end

  def add_token(column, player)
    @board[column].size.times do |i|
      if @board[column][i].nil?
        @board[column][i] = player
        break
      end
    end
    @board
  end

  def line_of_four?
    #horizontal
    (@board.size - 4).times do |i|
      (@board[i].size).times do |j|
        if @board[i][j] == @board[i + 1][j] && @board[i][j] == @board[i + 2][j] && @board[i][j] == @board[i + 3][j] && !@board[i][j].nil?
          return @board[i][j]
        end
      end
    end
    #vertical
    (@board.size).times do |i|
      (@board[i].size - 4).times do |j|
        if @board[i][j] == @board[i][j + 1] && @board[i][j] == @board[i][j + 2] && @board[i][j] == @board[i][j + 3] && !@board[i][j].nil?
          return @board[i][j]
        end
      end
    end
    #ascending diagonal
    (@board.size - 4).times do |i|
      (@board[i].size - 4).times do |j|
        if @board[i][j] == @board[i + 1][j + 1] && @board[i][j] == @board[i + 2][j + 2] && @board[i][j] == @board[i + 3][j + 3] && !@board[i][j].nil?
          return @board[i][j]
        end
      end
    end
    #descending vertically
    (@board.size - 4).times do |i|
      for j in (@board[i].size - 3)..(@board[i].size - 1)
        if @board[i][j] == @board[i + 1][j - 1] && @board[i][j] == @board[i + 2][j - 2] && @board[i][j] == @board[i + 3][j - 3] && !@board[i][j].nil?
          return @board[i][j]
        end
      end
    end
    return nil
  end

  def play
    create_board
    turn_count = 0
    while line_of_four?.nil?
      puts show_board
      if turn_count % 2 == 0
        p "Player 1 select a column to place a token [0-6]"
        column = gets.chomp.to_i
        add_token(column, 1)
      else
        p "Player 2 select a column to place a token [0-6]"
        column = gets.chomp.to_i
        add_token(column, 2)
      end
      turn_count += 1
      if line_of_four?.nil? == false
      puts show_board
        p "Player #{line_of_four?} wins!"
      end
    end
  end
end

connect_four = Connect_four.new
connect_four.create_board
connect_four.play
