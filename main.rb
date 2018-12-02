require_relative "1"
require_relative "2"

# 1
input_1 = File.readlines('./input_1.txt').map(&:to_i)
puts "Solution to 1A: #{Day1.problem_a(input_1)}"
puts "Solution to 1B: #{Day1.problem_b(input_1)}"

input_2 = File.readlines('./input_2.txt')
puts "Solution to 2A: #{Day2.problem_a(input_2)}"
puts "Solution to 2A: #{Day2.problem_b(input_2)}"