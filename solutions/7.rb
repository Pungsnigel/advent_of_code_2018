module Day7
  class << self
    def problem_a(instructions)
      step_requirements = steps(instructions)
      keycode = ''
      until step_requirements.empty?
        possible_step, = step_requirements.find do |_step, blockers|
          blockers.empty? || blockers.all? { |task| keycode.include?(task) }
        end
        keycode += possible_step
        step_requirements.delete(possible_step)
      end
      keycode
    end

    def problem_b(instructions, time_offset = 60, worker_count = 5)
      seconds = -1
      task_list = steps(instructions)
      tasks_in_progress = {}

      until task_list.empty? && tasks_in_progress.empty?
        seconds += 1
        tasks_in_progress = tasks_in_progress.transform_values { |v| v - 1 }
                                             .delete_if { |_k, v| v.zero? }
        next if tasks_in_progress.count >= worker_count

        unhindered_tasks = task_list.reject do |_task, blockers|
          step_blocked?(blockers, task_list, tasks_in_progress)
        end.keys

        while tasks_in_progress.count < worker_count && !unhindered_tasks.empty?
          task = unhindered_tasks.shift
          task_list.delete(task)
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

    def step_blocked?(blockers, unstarted_tasks, tasks_in_progress)
      return false if blockers.empty?

      blockers.any? do |task|
        unstarted_tasks.key?(task) || tasks_in_progress.key?(task)
      end
    end
  end
end
