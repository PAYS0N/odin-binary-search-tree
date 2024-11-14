# frozen_string_literal: true

require_relative("binary_search_tree")

tree = OdinBinarySearchTree::BinarySearchTree.new([1, 2, 3, 4, 5, 6, 7, 8])
tree.pretty_print
tree = OdinBinarySearchTree::BinarySearchTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.pretty_print
