module Day2
  class << self
    def problem_a(ids)
      count_with_occurence(2, ids) * count_with_occurence(3, ids)
    end

    def problem_b
    end

    def count_with_occurence(occurence, strings)
      strings.count do |string|
        present_chars = string.split('').uniq
        present_chars.any? { |char| string.count(char) == occurence }
      end
    end
  end
end
