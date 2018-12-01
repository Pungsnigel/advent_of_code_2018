# Solution A:
changes = File.readlines('./input_1.txt')
resulting_frequency = changes.map(&:to_i).reduce(:+)
puts "Solution to 1A: #{resulting_frequency}"

# Solution B:
changes = File.readlines('./input_1.txt').map(&:to_i).cycle
found_frequencies = Hash.new(0)
frequence = 0
found_frequencies[0] = 1
until found_frequencies[frequence] >= 2 do
  frequence += changes.next
  found_frequencies[frequence] += 1
end

puts "Solution to 1B: #{frequence}"