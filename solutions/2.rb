module Day2
  class << self
    def problem_a(ids)
      count_with_occurence(2, ids) * count_with_occurence(3, ids)
    end

    def problem_b(ids)
      ids.combination(2).each do |a, b|
        matches = similarities(a, b)
        return matches.join('') if a.length - matches.count <= 1
      end
    end

    private

    def count_with_occurence(occurence, strings)
      strings.count do |string|
        present_chars = string.split('').uniq
        present_chars.any? { |char| string.count(char) == occurence }
      end
    end

    def similarities(string_a, string_b)
      char_array_a = string_a.split(//)
      char_array_b = string_b.split(//)
      similarities = []
      char_array_a.each_with_index do |char, index|
        similarities << char if char_array_b[index] == char
      end
      similarities
    end
  end
end
