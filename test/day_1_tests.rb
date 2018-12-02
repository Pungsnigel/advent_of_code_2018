require "minitest/autorun"
require_relative("../1")

class Day1Tests < Minitest::Test
  def test_day_1_solution_a
    assert_equal(3, Day1.problem_a([1, 1, 1]))
    assert_equal(0, Day1.problem_a([1, 1, -2]))
    assert_equal(-6, Day1.problem_a([-1, -2, -3]))
  end

  def test_day_1_solution_b
    assert_equal(0, Day1::problem_b([1, -1]))
    assert_equal(10, Day1::problem_b([3, 3, 4, -2, -4]))
    assert_equal(5, Day1::problem_b([-6, 3, 8, 5, -6]))
    assert_equal(14, Day1::problem_b([7, 7, -2, -7, -4]))
  end
end