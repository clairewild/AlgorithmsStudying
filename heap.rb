class BinaryMinHeap
  def initialize
    @store = []
  end

  def count
    @store.length
  end

  def peak
    @store.first
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    min = @store.pop
    sink!(0)
    min
  end

  def push(val)
    @store << val
    swim!(count - 1)
  end

  protected
  attr_accessor :store

  private
  def self.parent_idx(child_idx)
    raise "Root has no parent" if child_idx == 0
    (child_idx - 1) / 2
  end

  def self.child_idx(len, parent_idx)
    indices = []
    i = parent_idx * 2 + 1
    j = parent_idx * 2 + 2
    indices << i if i < len
    indices << j if j < len
    indices
  end

  def sink!(parent_idx)
    i = parent_idx
    while i < count
      child_idx = BinaryMinHeap.child_idx(count, i)
      smallest = child_idx.min
      if smallest && @store[i] > @store[smallest]
        @store[i], @store[smallest] = @store[smallest], @store[i]
      end
      i += 1
    end
  end

  def swim!(child_idx)
    i = child_idx
    while i > 0
      parent_idx = BinaryMinHeap.parent_idx(i)
      if @store[i] < @store[parent_idx]
        @store[i], @store[parent_idx] = @store[parent_idx], @store[i]
      end
      i -= 1
    end
  end
end
