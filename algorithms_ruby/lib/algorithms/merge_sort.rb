module Algorithms
  def self.merge_sort(list, compare = lambda { |x,y| x < y})

    def self.merge(left, right, compare)
      result = []
      i, j = 0, 0

      while i < left.size && j < right.size
        if compare.call(left[i], right[j])
          result << left[i]
          i += 1
        else
          result << right[j]
          j += 1
        end
      end

      while i < left.size
        result << left[i]
        i += 1
      end

      while j < right.size
        result << right[j]
        j += 1
      end

      result
    end

    return list if list.size < 2

    mid   = list.size/2
    left  = merge_sort(list[0...mid])
    right = merge_sort(list[mid...list.size])
    merge(left, right, compare)
  end
end
