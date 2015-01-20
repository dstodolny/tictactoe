class Game
  attr_reader :players, :board, :current_player, :other_player

  def initialize(players)
    @board = Board.new
    @players = players
    @current_player, @other_player = players.shuffle
  end

  def run
    turn = 0
    loop do
      prompt
      x, y = get_move
      set_cell(x, y, current_player.shape)
      if board.winner? current_player
        display_current_grid
        puts "Congratulations #{@current_player.name}! You have won!"
        break
      elsif turn == 8
        display_current_grid
        puts "Draw game"
        break
      end
      switch_players
      turn += 1
    end
    bye_bye
  end

  private

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

  def prompt
    puts "#{@current_player}'s turn"
    display_current_grid
    print "(#{current_player.shape})> "
  end

  def display_current_grid
    @board.display
  end

  def set_cell(x, y, shape)
    board.set_cell(x, y, shape)
  end

  def get_move(move = gets.chomp)
    get_xy(move) 
  end

  def get_xy(move)
    moves = {
      '1' => [0, 0],
      '2' => [0, 1],
      '3' => [0, 2],
      '4' => [1, 0],
      '5' => [1, 1],
      '6' => [1, 2],
      '7' => [2, 0],
      '8' => [2, 1],
      '9' => [2, 2]
    }
    moves[move]
  end

  def game_over?
    board.winner? @current_player
  end

  def bye_bye
    puts "Thanks for playing!"
  end
end

class Board
  attr_reader :grid
  def initialize
    @grid = create_grid
  end

  def set_cell(x, y, value)
    get_cell(x, y).value = value
  end

  def get_cell(x, y)
    grid[x][y]
  end

  def display
    puts "-------"
    puts "|#{grid[0][0]}|#{grid[0][1]}|#{grid[0][2]}|"
    puts "-------"
    puts "|#{grid[1][0]}|#{grid[1][1]}|#{grid[1][2]}|"
    puts "-------"
    puts "|#{grid[2][0]}|#{grid[2][1]}|#{grid[2][2]}|"
    puts "-------"
  end

  def winner?(player)
    flat_grid = grid.flatten
    patterns = [[0, 1, 2], [3, 4, 5],
                [6, 7, 8], [0, 3, 6],
                [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]]
    patterns.any? do |pattern|
      pattern.all? { |cell| flat_grid[cell].value == player.shape }
    end
  end

  private

  def create_grid
    Array.new(3) { Array.new(3) { Cell.new } }
  end
end

class Cell
  attr_accessor :value

  def initialize
    @value = ' '
  end

  def to_s
    @value
  end
end

class Player
  attr_reader :name, :shape

  def initialize(name, shape)
    @name = name
    @shape = shape
  end

  def to_s
    @name
  end
end

game = Game.new([Player.new("Player 1", "X"), Player.new("Player 2", "O")])
game.run
