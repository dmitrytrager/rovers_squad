require './app/rover'

class Squad
  attr_reader :plateau, :rovers

  def initialize(data, plateau)
    @plateau = plateau

    @rovers = remove_collisions(create_rovers(data))
  end

  def move
    @rovers.each do |rover|
      plateau.add_rover rover.move(plateau)
    end
  end

  def to_s
    @rovers
      .map(&:to_s)
      .join("\n\n") << "\n"
  end

  private

  def create_rovers(rovers_data)
    rovers_data.each_slice(2).map do |rover_data|
      Rover.new(*rover_data)
    end
  end

  def remove_collisions(rovers)
    unique_indexes = unique_rovers_indexes(rovers)
    unique_rovers = rovers.values_at(*unique_indexes)

    warn_about_non_unique_rovers(rovers, unique_rovers)
    unique_rovers
  end

  def unique_rovers_indexes(rovers)
    rovers
      .map.with_index { |rover, i| { label: rover.label, index: i } }
      .uniq { |item| item[:label] }
      .map { |item| item[:index] }
  end

  def warn_about_non_unique_rovers(rovers, unique_rovers)
    rovers.each_with_index do |rover, i|
      unless unique_rovers.include? rover
        puts "Rover no. #{i} was removed from squad because of position collision"
      end
    end
  end
end
