require_relative 'version_manager'
require_relative 'binary_tree'

vm = VersionManager.new("1.0.0")
vm.major! # 2.0.0
vm.minor! # 2.1.0
vm.patch! # 2.1.1
print vm.release, "\n" #=> 2.1.1
vm.rollback! #1.0.0 - тот, который был задан при определении объекта класса
print vm.release, "\n" #=>1.0.0

vm = VersionManager.new # 0.0.1
vm.major! # 1.0.0
vm.minor! # 1.1.0
vm.patch! # 1.1.1
print vm.release, "\n" #=> 1.1.1
vm.rollback! # 0.0.1
print vm.release, "\n" #=> 0.0.1

# итого у нас два объекта VersionManager
# но хотелось бы все-таки вести именно историю версий при любом изменении версии,
# так как роллбэк возвращает значение, которое было передано при создании объекта

tree = BinaryTree.new
tree.add(1)
tree.add(2)
tree.add(3)
tree.add(-1)
tree.add(0)
tree.add(-5)

# Дерево выглядит так:
#         1
#        / \
#      -1   2
#     /  \   \
#    -5  0   3

puts tree.to_s #=> ((( -5 ) -1 ( 0 )) 1 ( 2 ( 3 ))
p tree.find(-1).to_s #=> -1
p tree.find(0).to_s #=> 0
p tree.find(2).to_s #=> 2
p tree.find(33).to_s #=> пустая строка ""
#p tree.find('a').to_s # ERROR: invalid value
#p tree.find("abc").to_s # ERROR: invalid value
tree.delete(-1)
tree.delete(33)

# Теперь дерево выглядит так:
#         1
#        / \
#       0   2
#     /      \
#    -5      3

puts tree.to_s #=> ((( -5 ) 0 ) 1 ( 2 ( 3 ))
p tree.find(-5).to_s #=> -5
p tree.find(0).to_s #=> 0
p tree.find(-22).to_s #=> пустая строка ""
