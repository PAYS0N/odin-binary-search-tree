# frozen_string_literal: true

require_relative("binary_search_tree")

tree = OdinBinarySearchTree::BinarySearchTree.new([1, 2, 3, 4, 5, 6, 7, 8])
tree.pretty_print
tree = OdinBinarySearchTree::BinarySearchTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.pretty_print
tree.insert(12)
tree.insert(13)
tree.insert(12)
tree.insert(14)
tree.insert(15)
tree.insert(16)
tree.insert(13.5)
tree.pretty_print
tree.delete(16)
tree.pretty_print
tree.delete(14)
tree.pretty_print
tree.delete(6345)
tree.pretty_print
tree.delete(67)
tree.pretty_print
tree.delete(23)
tree.pretty_print
tree.insert(7.5)
tree.pretty_print
tree.insert(6)
tree.pretty_print
tree.insert(4.5)
tree.pretty_print
tree.delete(4)
tree.pretty_print
tree.insert(8.5)
tree.insert(4.25)
tree.insert(4.75)
tree.pretty_print
tree.delete(4.5)
tree.pretty_print
