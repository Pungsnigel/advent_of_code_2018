require 'minitest/autorun'
require_relative('../solutions/7')

class Day7Tests < Minitest::Test

  INSTRUCTIONS = [
    'Step C must be finished before step A can begin.',
    'Step C must be finished before step F can begin.',
    'Step A must be finished before step B can begin.',
    'Step A must be finished before step D can begin.',
    'Step B must be finished before step E can begin.',
    'Step D must be finished before step E can begin.',
    'Step F must be finished before step E can begin.'
  ].freeze

  def test_day_7_solution_a
    assert_equal('CABDFE', Day7.problem_a(INSTRUCTIONS))
  end

  def test_day_7_solution_b
    assert_equal(15, Day7.problem_b(INSTRUCTIONS, 0, 2))
  end
end
