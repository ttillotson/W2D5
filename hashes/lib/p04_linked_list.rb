class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
    self.next = nil
    self.prev = nil
  end

  def inspect
    "val: #{val} next: #{self.next} prev: #{self.prev}"
  end
end

class LinkedList
  attr_accessor :head, :tail
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @tail.prev = self.head
    @head.next = self.tail
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    current_node = self.head
    until current_node == self.tail || current_node.key == key
      current_node = current_node.next
    end

    current_node.val
  end

  def include?(key)
    current_node = self.head
    until current_node == self.tail
      return true if current_node.key == key
      current_node = current_node.next
    end

    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = self.tail.prev
    node.next = self.tail
    self.tail.prev.next = node
    self.tail.prev = node
  end

  def update(key, val)
    current_node = self.head
    until current_node.key == key || current_node == self.tail
      current_node = current_node.next
    end
    current_node.val = val unless current_node == self.tail
  end

  def remove(key)
    current_node = self.head
    until current_node.key == key || current_node == self.tail
      current_node = current_node.next
    end
    current_node.remove unless current_node == self.tail
  end

  def each(&prc)
    current_node = self.head.next
    until current_node == self.tail
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
