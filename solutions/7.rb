module Day7
  class << self
    def problem_a(instructions)
      step_requirements = steps(instructions)
      keycode = ''
      until step_requirements.empty?
        possible_step, = step_requirements.find do |_step, requirements|
          requirements.empty? ||
            requirements.all? { |requirement| keycode.include?(requirement) }
        end
        keycode += possible_step
        step_requirements.delete(possible_step)
      end
      
      keycode
    end

    def problem_b(instructions, time_offset = 60, worker_count = 5)
      seconds = 0
      task_list = steps(instructions)
      tasks_in_progress = Hash.new(0)
      tick = lambda do
        tasks_in_progress.transform_values! { |v| v - 1 }
        seconds += 1
        tasks_in_progress = tasks_in_progress.delete_if { |_k, v| v.zero? }
      end

      until task_list.empty?
        tick.call
        puts seconds
        next if tasks_in_progress.count == worker_count
        unhindered_tasks = task_list.select do |_step, requirements|
          requirements.empty? ||
            requirements.none? do |requirement|
              task_list.keys.include?(requirement) ||
                tasks_in_progress.keys.include?(requirement)
            end
        end.keys

        next if unhindered_tasks.empty?

        while tasks_in_progress.count < worker_count && !unhindered_tasks.empty?
          task = unhindered_tasks.shift
          tasks_in_progress[task] = time_offset + ('A'..'Z').to_a.index(task) + 1
        end
      end

      seconds
    end

    private

    def steps(instructions)
      steps = Hash.new { |h, k| h[k] = [] }
      instructions.each_with_object(steps) do |instruction, hash|
        requirement, step = instruction.scan(/\b[A-Za-z]\b/)
        hash[step] << requirement
        hash[requirement] ||= []
      end.sort.to_h
    end
  end
end
