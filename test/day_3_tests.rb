require 'minitest/autorun'
require_relative('../3')

class Day3Tests < Minitest::Test
  def test_day_3_solution_a
    suggestions = ['#1 @ 1,3: 4x4', '#2 @ 3,1: 4x4', '#3 @ 5,5: 2x2']
    assert_equal(4, Day3.problem_a(suggestions))
  end

  def test_day_3_solution_b
    suggestions = ['#1 @ 1,3: 4x4', '#2 @ 3,1: 4x4', '#3 @ 5,5: 2x2']
    assert_equal('#3', Day3.problem_b(suggestions))
  end
end
