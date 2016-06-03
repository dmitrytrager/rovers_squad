require './app/rover'

describe Rover do
  let(:rover) { Rover.new("1 1 N", "RMMR") }

  describe "#label" do
    subject { rover.label }

    it "returns string label for rover position" do
      expect(subject).to eq("1-1")
    end
  end

  describe "#to_s" do
    subject { rover.to_s }

    it "returns position data back" do
      expect(subject).to eq("1 1 N")
    end
  end

  describe "#move" do
    subject { rover.to_s }

    let(:plateau) { double "plateau" }
    before do
      allow(plateau).to receive(:field_available?) { true }
    end

    it "moves according to the set of commands" do
      expect(rover.move(plateau)).to eq("3-1")
      expect(rover.to_s).to eq("3 1 S")
    end
  end
end
