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

  def taken?(x, y)
    get_cell(x, y).value != ' '
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
