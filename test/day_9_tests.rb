require 'minitest/autorun'
require_relative('../solutions/9')

class Day9Tests < Minitest::Test
  def test_day_9_solution_a
    # line = "10 players; last marble is worth 1618 points"
    line = "9 players; last marble is worth 25 points"
    assert_equal(32, Day9.problem_a(line))
  end

  def test_day_9_solution_b
    numbers = ['2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2']
    assert_equal(66, Day9.problem_b(numbers))
  end
end
