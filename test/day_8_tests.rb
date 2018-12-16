require 'minitest/autorun'
require_relative('../solutions/8')

class Day8Tests < Minitest::Test
  def test_day_8_solution_a
    numbers = ['2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2']
    assert_equal(138, Day8.problem_a(numbers))
  end

  def test_day_8_solution_b
    numbers = ['2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2']
    assert_equal(66, Day8.problem_b(numbers))
  end
end
