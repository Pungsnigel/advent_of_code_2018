require 'minitest/autorun'
require_relative('../6')

class Day6Tests < Minitest::Test
  def test_day_6_solution_a
    coordinates = ["1, 1", "1, 6", "8, 3", "3, 4", "5, 5", "8, 9"]
    assert_equal(17, Day6.problem_a(coordinates))
  end

  def test_day_6_solution_b
    coordinates = ["1, 1", "1, 6", "8, 3", "3, 4", "5, 5", "8, 9"]
    assert_equal(16, Day6.problem_b(coordinates, 32))
  end
end
