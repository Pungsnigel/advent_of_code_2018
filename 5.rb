module Day5
  class << self
    def problem_a(polymer)
      trim(polymer.chars).size
    end

    def problem_b(polymer)
      original_trimmed_chars = trim(polymer.chars)
      most_problematic_type = ('a'..'z').min_by do |char|
        chars = original_trimmed_chars.clone
        delete_type(char, chars)
        trim(chars).count
      end
      chars = original_trimmed_chars.clone
      delete_type(most_problematic_type, chars)
      trim(chars).count
    end

    def delete_type(type, chars)
      chars.delete(type)
      chars.delete(type.upcase)
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
