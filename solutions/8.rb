module Day8
  class << self
    def problem_a(numbers)
      numbers = numbers.flat_map { |line| line.split(' ').flat_map(&:to_i) }
      root_node = build_root(numbers)
      sum(root_node) { |node| node[:metadata].sum }
    end

    def problem_b(numbers)
      numbers = numbers.flat_map { |line| line.split(' ').flat_map(&:to_i) }
      root_node = build_root(numbers)
      value(root_node)
    end

    private

    def sum(node, &block)
      yield(node) + (node[:child_nodes].sum { |child| sum(child, &block) })
    end

    def value(node)
      return 0 if node.nil?
      return node[:metadata].sum if node[:child_nodes].empty?

      node[:metadata].sum { |entry| value(node[:child_nodes][entry - 1]) }
    end

    def build_root(numbers)
      _build_node(numbers)
    end

    def _build_node(numbers)
      number_of_children = numbers.shift
      number_of_metadata = numbers.shift
      { metadata: [], child_nodes: [] }.tap do |node|
        number_of_children.times { node[:child_nodes] << _build_node(numbers) }
        node[:metadata] = numbers.shift(number_of_metadata)
      end
    end
  end
end
