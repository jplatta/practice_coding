module Algorithms
  #list = array, left is an integer, right is an integer
  def self.quick_sort(list, left, right)

    def self.partition(list, left, right)
      pivot = list[(left + right)/2]

      while left <= right

        left += 1 while list[left] < pivot
        right -= 1 while list[right] > pivot
        
        if left <= right
          list[left], list[right] = list[right], list[left]
          left += 1
          right -= 1
        end
      end

      left
    end

    index = partition(list, left, right)

    quick_sort(list, left, index - 1) if left < index - 1

    quick_sort(list, index, right) if index < right

    list
  end
end
