require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket_list = @store[bucket(key)]
    bucket_list.include?(key)
  end

  def set(key, val)
    bucket_list = @store[bucket(key)]
    if bucket_list.include?(key)
      bucket_list.update(key, val)
    else
      resize! if count == @store.length
      bucket_list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    bucket_list = @store[bucket(key)]
    if bucket_list.include?(key)
      bucket_list.remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    # bucket_list = @store[bucket(key)]
    @store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { LinkedList.new }
    @store.each do |linked_list|
      linked_list.each do |node|
        new_store[node.key.hash % new_store.length].append(node.key, node.val)
      end
    end
    @store = new_store
  end

  def bucket(key)
    (key.hash % @store.length)
  end
end
