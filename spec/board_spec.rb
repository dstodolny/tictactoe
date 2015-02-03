require 'board'

describe Board do
  let(:board) { Board.new }

  context "#initialize" do
    it "initializes the board with a grid" do
      expect { board.grid }.to_not raise_error
    end

    it "sets the grid with three rows" do
      expect(board.grid.size).to eq 3
    end

    it "creates three things in each row" do
      board.grid.each do |row|
        expect(row.size).to eq 3
      end
    end
  end

  context "#set_cell" do
    it "updates the value of the cell object at a (x, y) coordinate" do
      board.set_cell(0, 0, "X")
      expect(board.grid[0][0].value).to eq "X"
    end
  end

  context "#get_cell" do
    it "sets gets the value of the cell at a (x, y) coordinate" do
      expect(board.get_cell(0, 0).value).to eq " "
    end
  end

  context "#taken?" do
    it "returns true if cell is already taken" do
      board.set_cell(0, 0, "X")
      expect(board.taken?(0, 0)).to be true
    end

    it "returns false if cell is empty" do
      expect(board.taken?(0, 0)).to be false
    end
  end

  context "#winner?" do
    let(:player) { Player.new("Dominik", "X") }

    it "returns true if players forms an upper row" do
      board.set_cell(0, 0, "X")
      board.set_cell(0, 1, "X")
      board.set_cell(0, 2, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a middle row" do
      board.set_cell(1, 0, "X")
      board.set_cell(1, 1, "X")
      board.set_cell(1, 2, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a bottom row" do
      board.set_cell(2, 0, "X")
      board.set_cell(2, 1, "X")
      board.set_cell(2, 2, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a left column" do
      board.set_cell(0, 0, "X")
      board.set_cell(1, 0, "X")
      board.set_cell(2, 0, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a middle column" do
      board.set_cell(0, 1, "X")
      board.set_cell(1, 1, "X")
      board.set_cell(2, 1, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a right column" do
      board.set_cell(0, 2, "X")
      board.set_cell(1, 2, "X")
      board.set_cell(2, 2, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a left diagonal" do
      board.set_cell(0, 0, "X")
      board.set_cell(1, 1, "X")
      board.set_cell(2, 2, "X")
      expect(board.winner?(player)).to be true
    end

    it "returns true if players forms a right diagonal" do
      board.set_cell(0, 2, "X")
      board.set_cell(1, 1, "X")
      board.set_cell(2, 0, "X")
      expect(board.winner?(player)).to be true
    end

    it "return false if there is a draw game" do
      board.set_cell(0, 0, "X")
      board.set_cell(0, 1, "O")
      board.set_cell(0, 2, "X")
      board.set_cell(1, 0, "O")
      board.set_cell(1, 1, "X")
      board.set_cell(1, 2, "X")
      board.set_cell(2, 0, "O")
      board.set_cell(2, 1, "X")
      board.set_cell(2, 2, "O")
      expect(board.winner?(player)).to be false
    end
  end
end
