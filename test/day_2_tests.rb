require "minitest/autorun"
require_relative("../2")

class Day1Tests < Minitest::Test
  def test_day_2_solution_a
    ids = ["abcdef","bababc","abbcde","abcccd","aabcdd","abcdee","ababab"]
    expected_checksum = 12
    assert_equal(expected_checksum, Day2::problem_a(ids))
  end

  def test_day_2_solution_b
  end
end
