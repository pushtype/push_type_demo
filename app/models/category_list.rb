class CategoryList < PushType::Node

  # By default a node can have children of any other node type.
  # Optionally pass a list of acceptable node types or prevent
  # any descendents by passing false.
  has_child_nodes :category

end