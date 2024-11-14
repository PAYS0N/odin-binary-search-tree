# frozen_string_literal: true

require_relative("node")

module OdinBinarySearchTree
  # Implementation of binary search tree
  class BinarySearchTree
    attr_reader :root

    def initialize(arr)
      arr = clean(arr)
      @root = build_tree(arr)
    end

    def build_tree(arr)
      return nil if arr == []

      left = arr[0...arr.length / 2]
      right = arr[(arr.length / 2) + 1..]
      root = OdinBinarySearchTree::Node.new(arr[arr.length / 2])
      root.left = build_tree(left)
      root.right = build_tree(right)
      root
    end

    def clean(arr)
      arr.sort.uniq
    end

    # print function from unknown fellow student
    def pretty_print(node = @root, prefix = "", is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.val}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
  end
end
