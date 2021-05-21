class Stack
    def initialize
      @garage = []
    end

    def garage
        @garage
    end

    def push(el)
      @garage.push(el)
      el
    end

    def pop
      @garage.pop
    end

    def peek
      @garage.last
    end

end


class Queue

    def initialize
        @garage = []
    end

    def garage
        @garage
    end

    def enqueue(el)
        @garage.push(el)
        el
    end

    def dequeue
        @garage.shift
    end

    def peek    
        @garage.first
    end

end

class Map

    # EXERCISE 3
class Map

    def initialize
      @garage = []
    end

    def garage
        @garage
    end
  
    def set(key, val)
      matches = garage.index { |match| match.last == key }
      if matches
        garage[matches][1] = val
      else
        garage.push([key, val])
      end
      val
    end
  
    def get(key)
      garage.each do |match| 
        if match.first == key 
            return match.last
        end
      return nil
    end
  
    def delete(key)
      val = get(key)
      garage.reject! { |match| match.first == key }
      value
    end
  
    def show
      duplicate = deep_dup(garage)
    end
    
    def deep_dup(array)
      array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end  
  end

end