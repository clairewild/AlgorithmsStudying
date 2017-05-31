class HashSet
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
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

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    @count -= 1
    list = bucket(key)
    list.remove(key) if list.include?(key)
  end

  def each

  end

  private
  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_store = Array.new(new_num_buckets) { LinkedList.new }

    self.each do |key, val|
      new_store[key.hash % new_num_buckets].append(key, val)
    end

    @store = new_store
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end

class LinkedList
  def initialize

  end

  def include?(key)

  end

  def get(key)

  end

  def

end

class ListNode

end
