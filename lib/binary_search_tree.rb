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

    def print
      if @root.nil?
        puts "The tree is empty"
      else
        pretty_print(@root)
      end
    end

    def insert(val)
      return @root = OdinBinarySearchTree::Node.new(val) if (curr = @root).nil?

      loop do
        if val < curr.val
          # if curr was not changed, then the insert was completed, and the function is done
          break if curr == curr = insert_helper_left(curr, val)
        elsif val > curr.val
          break if curr == curr = insert_helper_right(curr, val)
        else
          break
        end
      end
    end

    def delete(val)
      return delete_root if @root.val == val

      recursive_delete(@root, val)
    end

    def find(val, curr = @root)
      return curr if curr.val == val
      return find(val, curr.left) unless val > curr.val || curr.left.nil?

      find(val, curr.right) unless curr.right.nil?
    end

    def level_order
      queue = [@root]
      until queue.empty?
        node = queue.shift
        queue.push(node.left) unless node.left.nil?
        queue.push(node.right) unless node.right.nil?
        yield(node)
      end
    end

    def preorder(&block)
      traverse(:preorder, &block)
    end

    def inorder(&block)
      traverse(:inorder, &block)
    end

    def postorder(&block)
      traverse(:postorder, &block)
    end

    def height(node, height = 0)
      return height - 1 if node.nil?

      [height(node.left, height + 1), height(node.right, height + 1)].max
    end

    def depth(node)
      curr = @root
      depth = 0
      until curr == node || curr.nil?
        curr = node.val < curr.val ? curr.left : curr.right
        depth += 1
      end
      return depth unless curr.nil?

      nil
    end

    # slow O(n^2)
    def balanced?(node = @root)
      return true if node.nil?
      return false if (height(node.left) - height(node.right)).abs > 1

      balanced?(node.left) && balanced?(node.right)
    end

    def rebalance
      @root = build_tree(clean(preorder))
    end

    private

    # print function from unknown fellow student
    def pretty_print(node = @root, prefix = "", is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.val}"
      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

    # changes current node if not there yet, otherwise inserts and doesnt change current
    def insert_helper_left(curr, val)
      if curr.left.nil?
        curr.left = OdinBinarySearchTree::Node.new(val)
      else
        curr = curr.left
      end
      curr
    end

    # changes current node if not there yet, otherwise inserts and doesnt change current
    def insert_helper_right(curr, val)
      if curr.right.nil?
        curr.right = OdinBinarySearchTree::Node.new(val)
      else
        curr = curr.right
      end
      curr
    end

    def clean(arr)
      arr.sort.uniq
    end

    def recursive_delete(node, val)
      child = val < node.val ? node.left : node.right
      if child.nil?
        nil
      elsif child.val == val
        delete_node(node, val)
      else
        recursive_delete(child, val)
      end
    end

    def delete_node(node, val)
      node_to_delete = if node.left.nil?
                         node.right
                       else
                         node.left.val == val ? node.left : node.right
                       end
      return delete_leaf(node, val) if leaf(node_to_delete)
      return delete_two(node_to_delete) unless node_to_delete.left.nil? || node_to_delete.right.nil?

      delete_one(node_to_delete)
    end

    def leaf(node)
      node.left.nil? && node.right.nil?
    end

    def delete_leaf(node, val)
      if val < node.val
        node.left = nil
      else
        node.right = nil
      end
    end

    def delete_one(node)
      child = node.left.nil? ? node.right : node.left
      node_replace(node, child)
    end

    def delete_two(node)
      child = node.right
      if child.left.nil?
        switch_right(node)
      else
        child = child.left until child.left.left.nil?
        node_to_delete = child.left
        node.val = node_to_delete.val
        node_to_delete.right.nil? ? delete_leaf(child, node_to_delete.val) : delete_one(node_to_delete)
      end
    end

    def delete_root
      return @root = nil if leaf(@root)
      return delete_two(@root) unless @root.left.nil? || @root.right.nil?

      delete_one(@root)
    end

    def switch_right(node)
      node.val = node.right.val
      node.right = nil
    end

    def node_replace(node_to_write, node_to_read)
      node_to_write.val = node_to_read.val
      node_to_write.left = node_to_read.left
      node_to_write.right = node_to_read.right
    end

    def traverse(type, &block)
      arr = []
      block = ->(n) { arr.push(n.val) } if block.nil?

      traverse_helper(type, @root, &block)
      arr unless block_given?
    end

    def traverse_helper(type, node, &block)
      yield(node) if type == :preorder
      traverse_helper(type, node.left, &block) unless node.left.nil?
      yield(node) if type == :inorder
      traverse_helper(type, node.right, &block) unless node.right.nil?
      yield(node) if type == :postorder
    end
  end
end
