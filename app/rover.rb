class Rover
  HEADINGS = %w(N E S W)

  attr_reader :commands, :x, :y, :head

  def initialize(position, commands)
    @commands = commands.chars
    @x, @y, @head = position.split(" ")

    @x = x.to_i
    @y = y.to_i
    @head = HEADINGS.index(head)
  end

  def label
    label_for(x, y)
  end

  def heading
    HEADINGS[head]
  end

  def to_s
    [x, y, heading].join(" ")
  end

  def move(plateau)
    commands.each do |command|
      do_command(command, plateau)
    end

    label
  end

  private

  def label_for(x, y)
    "#{x}-#{y}"
  end

  def do_command(command, plateau)
    case command
    when "L"
      @head = head - 1
    when "R"
      @head = head + 1
    when "M"
      try_to_move(plateau)
    end

    @head = head - 4 if head >= 4
    @head = head + 4 if head < 0
  end

  def try_to_move(plateau)
    next_position = find_next_position()
    next_position_label = label_for(next_position[:x], next_position[:y])

    if plateau.field_available?(next_position, next_position_label)
      @x, @y = next_position[:x], next_position[:y] 
    end
  end

  def find_next_position
    case heading
    when "N"
      return { x: x, y: y + 1 }
    when "E"
      return  { x: x + 1, y: y }
    when "S"
      return { x: x, y: y - 1 }
    when "W"
      return { x: x - 1, y: y }
    end
  end
end
