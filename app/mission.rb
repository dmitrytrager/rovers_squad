require './app/plateau'
require './app/squad'

class Mission
  attr_reader :data, :plateau, :squad

  def initialize(input)
    @data = input.split("\n").reject(&:empty?)

    @plateau = Plateau.new(data.shift)
    @squad = Squad.new(data, plateau)
  end

  def perform
    squad.move
  end

  def result
    squad.to_s
  end
end
