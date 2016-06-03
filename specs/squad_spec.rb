require './app/squad'

describe Squad do
  let(:plateau) { double "plateau" }
  let(:data) do
    [
      "3 2 N",
      "RML",
      "5 1 N",
      "RML"
    ]
  end
  let(:squad) { Squad.new(data, plateau) }

  describe "#rovers" do
    it "created rovers according to data" do
      expect(squad.rovers.count).to eq(2)
    end

    context "when there is collision between rovers" do
      let(:data) do
        [
          "3 2 N",
          "RML",
          "3 2 N",
          "RML"
        ]
      end

      it "removes rovers that try to hold busy position" do
        expect(squad.rovers.count).to eq(1)
      end
    end
  end

  describe "#move" do
    before do
      allow(plateau).to receive(:field_available?) { true }
      allow(plateau).to receive(:add_rover)
    end

    it "add rovers to plateau when moving" do
      expect(plateau).to receive(:add_rover)

      squad.move
    end
  end
end
