require "minitest/autorun"
require_relative("../2")

class Day2Tests < Minitest::Test
  def test_day_2_solution_a
    ids = ["abcdef","bababc","abbcde","abcccd","aabcdd","abcdee","ababab"]
    assert_equal(12, Day2::problem_a(ids))
  end

  def test_day_2_solution_b
    ids = ["abcde", "fghij", "klmno", "pqrst", "fguij", "axcye", "wvxyz"]
    assert_equal("fgij", Day2::problem_b(ids))
  end
end
