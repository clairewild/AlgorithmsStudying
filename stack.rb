# Stack that can be implemented using
# Array, DoublyLinkedList, or SinglyLinkedList
# using the same API

class Stack
  def initialize(data_structure)
    @stack = data_structure.new
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def is_empty?
    @stack.empty?
  end
end

class DoublyLinkedList
  def initialize
    @head = ListNode.new(nil)
    @tail = ListNode.new(nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def push(el)
    node = DoubleNode.new(el)
    node.prev = last
    node.next = @tail
    last.next = node
    @tail.prev = node
  end

  def pop
    popped = last
    popped.remove
    popped
  end

  def empty?
    @head.next == @tail
  end

  private
  def first
    @head.next
  end

  def last
    @tail.prev
  end
end

class DoubleNode
  attr_accessor :next, :prev

  def initialize(val)
    @val = val
    @next = nil
    @prev = nil
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class SinglyLinkedList
  def initialize
    @first = nil
  end

  def push(val)
    node = SingleNode.new(val)
    node.next = @first
    @first = node
  end

  def pop
    popped = @first
    @first = popped.next
    popped
  end

  def empty?
    @first.nil?
  end
end

class SingleNode
  attr_accessor :next

  def initialize(val)
    @val = val
    @next = nil
  end
end
