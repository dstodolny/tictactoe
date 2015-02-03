require 'cell'

describe Cell do
  context "#initialize" do
    it "is initialized with a value of ' ' by default" do
      expect(Cell.new.value).to eq ' '
    end
  end

  context "#to_s" do
    it "displays value" do
      expect("#{Cell.new}").to eq ' '
    end
  end
end
