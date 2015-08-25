class Node
  attr_accessor :info, :next_node

  def initialize(data, next_node=nil)
    self.info = data
    self.next_node = next_node
  end
end
