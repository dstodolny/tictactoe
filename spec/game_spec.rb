require 'game'

describe Game do
  let(:player1) { Player.new("Player 1", "X") }
  let(:player2) { Player.new("Player 2", "O") }
  let(:game) { Game.new([player1, player2]) }

  context "#initialize" do
    it "randomly selects a current player" do
      allow_any_instance_of(Array).to receive(:shuffle) { [player2, player1] }
      game = Game.new([player1, player2])
      expect(game.current_player).to eq player2
    end

    it "randomly selects an other player" do
      allow_any_instance_of(Array).to receive(:shuffle) { [player2, player1] }
      game = Game.new([player1, player2])
      expect(game.other_player).to eq player1
    end
  end

  context "#switch_players" do
    it "will set @current_player to @other_player" do
      game = Game.new([player1, player2])
      other_player = game.other_player
      game.switch_players
      expect(game.current_player).to eq other_player
    end

    it "will set @other_player to @current_player" do
      game = Game.new([player1, player2])
      current_player = game.current_player
      game.switch_players
      expect(game.other_player).to eq current_player
    end
  end

  context "#get_move" do
    it "converts human_move of '1' to [0, 0]" do
      game = Game.new([player1, player2])
      expect(game.get_move("1")).to eq [0, 0]
    end

    it "converts human move of '7' to [2, 0]" do
      game = Game.new([player1, player2])
      expect(game.get_move("7")).to eq [2, 0]
    end
  end
end
