class Game
  attr_reader :players, :board, :current_player, :other_player

  def initialize(players)
    @board = Board.new
    @players = players
    @current_player, @other_player = players.shuffle
  end

  def run
    turn = 0
    x = y = nil
    loop do
      prompt
      loop do
        x, y = get_move
        break unless taken?(x, y)
        puts "That cell is already taken. Try again."
        print "(#{@current_player.shape})> "
      end
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

  def taken?(x, y)
    board.taken?(x, y)
  end

  def game_over?
    board.winner? @current_player
  end

  def bye_bye
    puts "Thanks for playing!"
  end
end

# game = Game.new([Player.new("Player 1", "X"), Player.new("Player 2", "O")])
# game.run
