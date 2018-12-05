module Day1
  def self.problem_a(changes)
    changes.reduce(:+)
  end

  def self.problem_b(changes)
    found_frequencies = Hash.new(0)
    frequency = 0
    found_frequencies[0] = 1
    changes.cycle do |change|
      frequency += change
      found_frequencies[frequency] += 1
      return frequency if found_frequencies[frequency] >= 2
    end
  end
end
