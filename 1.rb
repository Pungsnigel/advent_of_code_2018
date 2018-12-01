module Day1
  def self.problem_a(changes)
    changes.reduce(:+)
  end

  def self.problem_b(changes)
    changes = changes.cycle
    found_frequencies = Hash.new(0)
    frequency = 0
    found_frequencies[0] = 1
    until found_frequencies[frequency] >= 2 do
      frequency += changes.next
      found_frequencies[frequency] += 1
    end
    frequency
  end
end
