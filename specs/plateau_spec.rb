require './app/plateau'

describe Plateau do
  let(:plateau) { Plateau.new("5 5") }

  describe "#field_available?" do
    subject { plateau.field_available?(pos, pos_label) }

    before do
      plateau.add_rover "3-3"
      plateau.add_rover "5-1"
    end

    context "when field is out of the bounds" do
      let(:pos) { { x: -1, y: 3 } }
      let(:pos_label) { nil }
    
      it "returns false" do
        expect(subject).to be_falsey
      end
    end

    context "when field is in the bounds" do
      context "when field is busy" do
        let(:pos) { { x: 5, y: 1 }  }
        let(:pos_label) { "5-1" }

        it "returns false" do
          expect(subject).to be_falsey
        end
      end

      context "when field is not busy" do
        let(:pos) { { x: 5, y: 3 } }
        let(:pos_label) { "5-3" }

        it "returns true" do
          expect(subject).to be_truthy
        end
      end
    end
  end
end
