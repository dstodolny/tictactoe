require './board.rb'
require './cell.rb'
require './game.rb'
require './player.rb'

game = Game.new([Player.new("Player 1", "X"), Player.new("Player 2", "O")])
game.run
