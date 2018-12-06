module Day5
  class << self
    def problem_a(polymer)
      trim!(polymer)
      polymer.size
    end

    def problem_b
    end

    def trim!(string)
      string.chars.each_cons(2).to_a.each_with_index do |(a, b), i|
        if a != b && a.casecmp(b).zero?
          string.slice!(i, 2)
          return trim!(string)
        end
      end
      string
    end
  end
end
