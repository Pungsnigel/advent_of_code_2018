module Day6
  class << self
    def problem_a(coordinates)
      coordinates = coordinates.map do |string|
        x, y = string.split(', ').map(&:to_i)
        { x: x, y: y }
      end

      infinites = []
      closest = measured_coordinates(coordinates).map do |measured|
        coordinate = coordinates.min_by { |c| manhattan_distance(c, measured) }
        infinites << coordinate if edge_coordinate?(measured, coordinates)
        coordinate
      end

      best_coordinate =
        coordinates
          .reject { |c| infinites.include?(c) }
          .max_by { |c| closest.count(c) }
      closest.count(best_coordinate)
    end

    def problem_b(coordinates, allowed_distance = 10000)
      coordinates = coordinates.map do |string|
        x, y = string.split(', ').map(&:to_i)
        { x: x, y: y }
      end

      measured_coordinates(coordinates)
        .keep_if do |c|
          coordinates.sum { |c2| manhattan_distance(c, c2) }  < allowed_distance
        end
        .count
    end

    private

    def edge_coordinate?(c, map)
      x1, x2, y1, y2 = edges(map)
      c[:x] == x1 || c[:x] == x2 || c[:y] == y1 || c[:y] == y2
    end

    def edges(coordinates)
      x1 = coordinates.min_by { |coordinate| coordinate[:x] }[:x]
      x2 = coordinates.max_by { |coordinate| coordinate[:x] }[:x]
      y1 = coordinates.min_by { |coordinate| coordinate[:y] }[:y]
      y2 = coordinates.max_by { |coordinate| coordinate[:y] }[:y]
      [x1, x2, y1, y2]
    end

    def measured_coordinates(coordinates)
      x1, x2, y1, y2 = edges(coordinates)
      (y1..y2).map do |row|
        (x1..x2).map do |column|
          { x: column, y: row }
        end
      end.flatten
    end

    def manhattan_distance(c1, c2)
      (c1[:x] - c2[:x]).abs + (c1[:y] - c2[:y]).abs
    end
  end
end
