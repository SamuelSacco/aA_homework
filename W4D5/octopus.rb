
def sluggish(arr)

  (0...arr.length).each do |i|
    max = true
    (i+1...arr.length).each do |j|
      max = false if arr[j].length > arr[i].length
    end
    return arr[i] if max
  end
  

end

sluggish(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|a, b| a <=> b}
    middle = self.length / 2
    left = self[0...middle]
    right = self[middle..-1]
    return self if self.length < 2

    Array.helper(left.merge_sort(&prc), right.merge_sort(&prc), &prc)

  end

  def self.helper(left, right, &prc)
    res = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        res << left.shift
      else
        res << right.shift
      end
    end
    res + left + right
  end

end

def dominant(arr)
  prc = Proc.new {|a, b| b.length <=> a.length}

  arr.merge_sort(&prc)[0]
end

p dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def clever(arr)
  max = arr.first

  arr.each do |fish|
    if fish.length > max.length
      max = fish
    end
  end
  max 
end

clever(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])


def slow_dance(dir, arr)
  arr.each_with_index do |move, idx|
  return idx if move == dir
  end
end

arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance('up', arr)

def fast_dance(dir, arr)
  arr.index(dir)
end

arr = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance('up', arr)