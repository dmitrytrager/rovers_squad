require './app/mission'

describe Mission do
  let(:mission) { Mission.new(data) }

  describe '#result' do
    let(:data) { File.open("./seeds/test.txt", "r") { |file| file.read } }

    it "returns data from input if navigation was not performed" do
      expect(mission.result).to eq(
<<-EOF
1 2 N

3 3 E
EOF
      )
    end

    it "performs navigation according to description" do
      expect(mission.tap(&:perform).result).to eq(
<<-EOF
1 3 N

5 1 E
EOF
      )
    end
  end
end
