class Plateau
  attr_reader :upper, :right, :rovers

  def initialize(coordinates)
    @upper, @right = coordinates.split(" ").map(&:to_i)

    @rovers = []
  end

  def add_rover(rover_label)
    rovers << rover_label
  end

  def field_available?(position, position_label)
    position_in_bounds?(position) && position_not_busy?(position_label)
  end

  private

  def position_in_bounds?(pos)
    pos[:x] >= 0 && pos[:x] <= right && pos[:y] >= 0 && pos[:y] <= upper
  end

  def position_not_busy?(label)
    !rovers.include?(label)
  end
end
