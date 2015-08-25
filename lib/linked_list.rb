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

  def insert
  end

  def remove
  end
end
