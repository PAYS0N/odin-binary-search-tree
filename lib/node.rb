# frozen_string_literal: true

module OdinBinarySearchTree
  # Implementation of binary search tree
  class Node
    include Comparable

    attr_accessor :left, :right, :val

    def initialize(val, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
    end

    def <=>(other)
      @val <=> other.val
    end
  end
end
