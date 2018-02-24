require_relative 'p02_hashing'

class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if count == num_buckets
      self[key] << key
      self.count += 1
    end
  end


  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = (num.hash % @store.length)
    @store[bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr2 = Array.new(num_buckets * 2) { [] }
    @store.each do |bucket|
      bucket.each do |el|
        arr2[el.hash % arr2.length] << el
      end
    end
    @store = arr2
  end
end
