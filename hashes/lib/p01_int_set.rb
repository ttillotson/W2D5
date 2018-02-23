class MaxIntSet
  def initialize(max)
    @set = Array.new(max){false}
  end

  def insert(num)
    if is_valid?(num)
      @set[num] = true
    else
      raise ("Out of range")
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

  end

  def remove(num)

  end

  def include?(num)
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
