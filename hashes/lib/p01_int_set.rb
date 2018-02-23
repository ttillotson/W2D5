class MaxIntSet
  def initialize(max)
    @set = Array.new(max){false}
  end

  def insert(num)
    if is_valid?(num)
      @set[num] = true
    else
      raise ("Out of bounds")
    end
  end

  def remove(num)
    if is_valid?(num)
       @set[num] = false
     else
      raise ("Never had it")
    end
  end

  def include?(num)
    if is_valid?(num)
      @set[num]
    else
      raise ("Number not included")
    end
  end

  private

  def is_valid?(num)
    num < @set.length && num > -1
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = num % @store.length
    @store[bucket]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      resize! if count == num_buckets
      self[num] << num
      self.count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = num % @store.length
    @store[bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr2 = Array.new(num_buckets * 2) {[]}
    @store.each do |bucket|
      bucket.each do |el|
        arr2[el % arr2.length] << el
      end
    end
    @store = arr2
  end
end
