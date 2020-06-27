# sluggish: quadratic search, n^2

def quadratic_biggest_fish(fishes)
  fishes.each_with_index do |fish1, idx1|
    max_length = true #assume fish1 is largest
    
    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2 #skips whenever idx are same to avoid dupes
      max_length = false if fish2.length > fish1.length #fish1 no longer max_length
    end
    
    return fish1 if max_length
  end

end

# dominant: n log n search
class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def nlogn_biggest_fish(fishes)
  # sort the array longest to shortest
  prc = Proc.new { |x, y| y.length <=> x.length }
  #return the first element
  fishes.merge_sort(&prc)[0]
end

# clever linear search
def linear_biggest_fish(fishes)
  #hold the biggest fish
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      #update the biggest fish
      biggest_fish = fish
    end
  end

  biggest_fish

end

# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index| # O(n)
    return index if tile == direction
  end
end

# constant octopus dance
#use a hash for constant lookup
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash) # no iterations, O(1), answers stored in memory
  tiles_hash[direction]
end
