class Category < PushType::Node

  # By default a node can have children of any other node type.
  # Optionally pass a list of acceptable node types or prevent
  # any descendents by passing false.
  has_child_nodes :category

  # By default a node will use it's own named template within the
  # application layout. This behaviour can be overidden and an
  # alternative :layout option can be passed.
  template 'article_list'

end