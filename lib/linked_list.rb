require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def prepend(info)
    @head = Node.new(info, @head)
  end

  def each
    node = @head

    while !node.nil?
      yield node
      node = node.next_node
    end
  end

  def to_s
    string = []
    self.each { |node| string << node.info }
    string = string.join(", ")
    "LinkedList(#{string})"
  end

  def [](index)
    index_counter = 0
    node = @head

    until index_counter == index
      node = node.next_node unless node.nil?
      index_counter += 1
    end

    node.nil? ? nil : node
  end

  def insert(index, value)
    if index == 0
      self.prepend(value)
    else
      index_counter = 0
      node = @head

      while index_counter < index - 1
        node = node.next_node unless node.nil?
        index_counter += 1
      end

      if node.nil?
        nil
      else
        node.next_node = Node.new(value, node.next_node)
      end
    end
  end

  def remove(index)
    if index == 0
      @head = @head.next_node
    else
      self[index-1].next_node = self[index+1]
    end
  end
end
