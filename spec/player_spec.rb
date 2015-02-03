require 'player'

describe Player do
  context "#initialize" do
    it "raises an exception when initialized without arguments" do
      expect { Player.new }.to raise_error
    end

    it "does not raise an error when initialized with two arguments" do
      expect { Player.new("Dominik", "X") }.to_not raise_error
    end
  end

  context "#name" do
    it "returns the player's name" do
      expect(Player.new("Dominik", "X").name).to eq "Dominik"
    end
  end

  context "#shape" do
    it "returns the player's shape" do
      expect(Player.new("Dominik", "X").shape).to eq "X"
    end
  end

  context "#to_s" do
    it "displays name" do
      expect("#{Player.new("Dominik", "X")}").to eq "Dominik"
    end
  end
end
