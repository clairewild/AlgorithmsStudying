class HashSet
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def get(key)
    bucket(key).get(key)
  end

  def set(key, val)
    list = bucket(key)
    if list.include?(key)
      list.update(key, val)
    else
      @count += 1
      resize! if @count > num_buckets
      new_list = bucket(key)
      new_list.append(key, val)
    end
  end

  def delete(key)
    @count -= 1
    list = bucket(key)
    list.remove(key) if list.include?(key)
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield(node.key node.val)
      end
    end
  end

  private
  def num_buckets
    @store.length
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { LinkedList.new }

    self.each do |key, val|
      new_store[key.hash % new_num_buckets].append(key, val)
    end

    @store = new_store
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = ListNode.new(nil)
    @tail = ListNode.new(nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def include?(key)
    node = self.get(key)
    node != nil
  end

  def get(key)
    self.each do |node|
      return node if node.key == key
    end
    nil
  end

  def append(key, val)
    node = ListNode.new(key, val)
    node.prev = last
    node.next = @tail
    @tail.prev = node
    last.next = node
  end

  def update(key, val)
    node = self.get(key)
    node.val = val if node
  end

  def remove(key)
    node = self.get(key)
    node.remove if node
  end

  def each
    current_node = first
    until current_node == @tail
      yield(current_node)
      current_node = current_node.next
    end
  end
end

class ListNode
  attr_accessor :next, :prev, :key, :val

  def initialize(key, val)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end
