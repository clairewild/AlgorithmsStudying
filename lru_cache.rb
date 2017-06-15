require_relative 'hash'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc # Takes key and returns val
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      link = @map.get(key)
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  private
  def update_link!(link)
    @store.remove(link.key)
    @store.append(link.key, link.val)
  end

  def calc!(key)
    val = @prc.call(key)
    @store.append(key, val)
    link = @store.last
    @map.set(key, link)
    eject! if count > @max
    val
  end

  def eject!
    link = @store.first
    @store.remove(link.key)
    @map.delete(link.key)
  end
end
