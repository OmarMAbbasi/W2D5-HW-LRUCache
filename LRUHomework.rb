 class LRUCache
    def initialize(cache_size)
        @cache_size = cache_size
        @cache = []
    end

    def count
      return @cache.length
    end

    def add(el)
        if has_ele?(el)
            @cache.delete_at(@cache.index(el))
        end
       @cache << el 
       @cache.shift if full? 
       return nil
    end

    def show
        p @cache
    end

    private
    def has_ele?(el)
        @cache.include?(el)
    end

    def full?
        @cache.length > @cache_size
    end
  end

    johnny_cache = LRUCache.new(4)

    johnny_cache.add("I walk the line")
    johnny_cache.add(5)

    johnny_cache.count # => returns 2

    johnny_cache.add([1,2,3])
    johnny_cache.add(5)
    johnny_cache.add(-5)
    johnny_cache.add({a: 1, b: 2, c: 3})
    johnny_cache.add([1,2,3,4])
    johnny_cache.add("I walk the line")
    johnny_cache.add(:ring_of_fire)
    johnny_cache.add("I walk the line")
    johnny_cache.add({a: 1, b: 2, c: 3})


    johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]