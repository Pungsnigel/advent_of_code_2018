require 'minitest/autorun'
require_relative('../5')

class Day5Tests < Minitest::Test
  def test_day_5_solution_a
    assert_equal(0, Day5.problem_a(['aA']))
    assert_equal(0, Day5.problem_a(['abBA']))
    assert_equal(4, Day5.problem_a(['abAB']))
    assert_equal(6, Day5.problem_a(['aabAAB']))
    assert_equal(10, Day5.problem_a(['dabAcCaCBAcCcaDA']))
  end

  def test_day_5_solution_b
    assert_equal(4, Day5.problem_b(['dabAcCaCBAcCcaDA']))
  end
end
