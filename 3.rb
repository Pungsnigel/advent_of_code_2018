module Day3
  class << self
    def problem_a(unparsed_suggestions)
      suggestions = parse_suggestions(unparsed_suggestions)
      overlaps = []
      suggestions.combination(2).each do |suggestion_a, suggestion_b|
        next unless suggestion_a.intersects?(suggestion_b)
        suggestion_a.each_coordinate do |x, y|
          overlaps << [x, y] if suggestion_b.spans_coordinate?(x, y)
        end
      end

      overlaps.uniq.count
    end

    def problem_b
    end

    private

    def parse_suggestions(suggestions)
      suggestions.map do |suggestion|
        id, _crap, start, size = suggestion.split(' ')
        next unless id && start && size

        start_x, start_y = start.tr(':', '').split(',').map(&:to_i)
        width, height = size.split('x').map(&:to_i)
        Suggestion.new(id, start_x, start_y, width, height)
      end
    end
  end

  class Suggestion
    attr_accessor :id
    attr_reader :start_x, :start_y
    def initialize(id, start_x, start_y, width, height)
      @id = id
      @start_x = start_x
      @start_y = start_y
      @width = width
      @height = height
    end

    def intersects?(other)
      return false if @start_x > other.last_x || other.start_x > last_x
      return false if @start_y > other.last_y || other.start_y > last_y
      true
    end

    def spans_coordinate?(x, y)
      x_overlaps?(x) && y_overlaps?(y)
    end

    def x_overlaps?(x)
      x >= @start_x && x < @start_x + @width
    end

    def y_overlaps?(y)
      y >= @start_y && y < @start_y + @height
    end

    def last_x
      @start_x + @width - 1
    end

    def last_y
      @start_y + @height - 1
    end

    def each_coordinate
      @width.times do |x_index|
        x = @start_x + x_index
        @height.times do |y_index|
          y = @start_y + y_index
          yield(x, y)
        end
      end
    end
  end
  private_constant :Suggestion
end
