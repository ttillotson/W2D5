class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashy = 0
    self.each_with_index do |el, ind|
      if el.is_a? (Array)
        hashy += (ind + 1) * el.hash
      elsif el.is_a? (String)
        el.each_byte.with_index do |c, i|
          hashy += (ind + 1) * c * (i + 1)
        end
      else
        hashy += (ind + 1) * el
      end
    end

    hashy
  end
end

class String
  def hash
    # ASCII
    hashy = 0
    each_byte.with_index do |c, i|
      hashy += c * (i + 1)
    end
    hashy
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashy = 0
    self.each do |k, el|
      hashy += (k.object_id * el.hash)
    end
    
    hashy
  end
end
