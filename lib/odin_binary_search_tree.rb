# frozen_string_literal: true

require_relative("binary_search_tree")

tree = OdinBinarySearchTree::BinarySearchTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.insert(12)
tree.insert(13)
tree.insert(12)
tree.insert(14)
tree.insert(15)
tree.insert(16)
tree.insert(13.5)
tree.delete(16)
tree.delete(14)
tree.delete(6345)
tree.delete(67)
tree.delete(23)
tree.insert(7.5)
tree.insert(6)
tree.insert(4.5)
tree.delete(4)
tree.insert(8.5)
tree.insert(4.25)
tree.insert(4.75)
tree.delete(4.5)
tree.delete(8)
tree.delete(8.5)
tree.delete(9)
tree.delete(12)
tree.delete(13)
tree.delete(13.5)
tree.delete(15)
tree.delete(324)
tree2 = OdinBinarySearchTree::BinarySearchTree.new([2])
tree2.print
tree2.delete(2)
tree2.print
tree2.insert(12)
tree2.print
tree2.insert(15)
tree2.print
tree2.insert(18)
tree2.print
puts tree2.find(15)
puts tree2.find(14)
tree.print
tree.level_order { |node| print "#{node.val} " }
puts ""
tree.preorder { |node| print "#{node.val} " }
puts ""
tree.inorder { |node| print "#{node.val} " }
puts ""
tree.postorder { |node| print "#{node.val} " }
puts ""
p tree.preorder
puts tree.height(tree.find(7))
puts tree.depth(tree.find(7))
puts tree.height(tree.find(5))
puts tree.depth(tree.find(5))
puts tree.height(tree.find(4.75))
puts tree.depth(tree.find(4.75))
puts tree.height(tree.find(4.25))
puts tree.depth(tree.find(4.25))
tree.print
puts "balanced? #{tree.balanced?}"
tree2.print
puts "balanced? #{tree2.balanced?}"
tree.insert(6.5)
tree.print
puts "balanced? #{tree.balanced?}"
