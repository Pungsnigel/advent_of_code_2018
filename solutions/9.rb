module Day9
  class << self
    def problem_a(input)
      player_count, marble_count = input.scan(/[0-9]+/).map(&:to_i)
      scores = Array.new(player_count, 0)
      players = (0...player_count).each.cycle
      circle = [0]
      current_marble = 0
      current_player = players.next
      (1..marble_count).each do |marble|
        if (marble % 23).zero?
          puts "player #{current_player} gets score of #{marble} and removes #{circle[(current_marble - 7) % circle.size]} from circle"
          scores[current_player] += marble
          scores[current_player] += circle.delete_at((current_marble - 7) % circle.size)
        else
          puts current_marble
          puts (current_marble + 1) % (circle.size + 1)
          current_marble = (current_marble + 1) % (circle.size + 1)
          circle.insert(current_marble, marble)
          puts "player #{current_player} places #{marble} into circle. Circl now: #{circle}"
        end
        current_player = players.next
      end
      puts scores.max
      scores.max
    end

    def problem_b(input)
    end
  end
end
