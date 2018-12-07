module Day5
  class << self
    def problem_a(polymer)
      trim(polymer.chars).size
    end

    def problem_b
    end

    def trim(chars)
      i = 0
      loop do
        break if i == chars.size - 1
        if chars[i].swapcase == chars[i + 1]
          2.times { chars.delete_at(i) }
          i -= 1
        else
          i += 1
        end
      end
      chars
    end
  end
end
