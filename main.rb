require_relative '1'
require_relative '2'
require_relative '3'
require_relative '4'

# 1
input1 = File.readlines('./input_1.txt').map(&:to_i)
puts "Solution to 1A: #{Day1.problem_a(input1)}"
puts "Solution to 1B: #{Day1.problem_b(input1)}"

input2 = File.readlines('./input_2.txt')
puts "Solution to 2A: #{Day2.problem_a(input2)}"
puts "Solution to 2B: #{Day2.problem_b(input2)}"

input3 = File.readlines('./input_3.txt')
puts "Solution to 3A: #{Day3.problem_a(input3)}"
puts "Solution to 3B: #{Day3.problem_b(input3)}"

input4 = File.readlines('./input_4.txt')
puts "Solution to 4A: #{Day4.problem_a(input4)}"
puts "Solution to 4B: #{Day4.problem_b(input4)}"
