require 'time'

module Day4
  class << self
    def problem_a(log_entries)
      entries = parse_entries(log_entries).sort

      sleepiest_guard, sleeps = sleep_intervals(entries).max_by do |_, intervals|
        intervals.sum(&:count)
      end

      worst_minute = (0..60).max_by do |minute|
        sleeps.count { |interval| interval.cover?(minute) }
      end

      sleepiest_guard * worst_minute
    end

    def problem_b(log_entries)
      entries = parse_entries(log_entries).sort

      guards_worst_minutes = sleep_intervals(entries).map do |guard, intervals|
        worst_count = intervals.count { |interval| interval.cover?(0) }
        worst_minute = 0
        (1..60).each do |minute|
          count = intervals.count { |interval| interval.cover?(minute) }
          if count > worst_count
            worst_count = count
            worst_minute = minute
          end
        end
        { guard: guard, worst_minute: worst_minute, times_asleep: worst_count }
      end

      worst_guard = guards_worst_minutes.max_by { |guard| guard[:times_asleep] }
      worst_guard[:guard] * worst_guard[:worst_minute]
    end

    private

    def parse_entries(entries)
      entries.map do |entry|
        entry.strip.match(/\[(\d+)-(\d\d)-(\d\d) (\d\d):(\d\d)\] (.+)/).captures
      end
    end

    def sleep_intervals(entries)
      current_guard = nil
      guard_intervals = Hash.new { |h, k| h[k] = [] }
      feel_asleep = 0
      entries.each do |_year, _month, _day, _hour, minute, message|
        minute = minute.to_i
        if message.include?('#')
          current_guard = message.gsub(/\D/, '').to_i
        elsif message.end_with?('asleep')
          feel_asleep = minute
        else
          guard_intervals[current_guard] << (feel_asleep..(minute - 1))
        end
      end
      guard_intervals
    end
  end
end
