module Algorithms
  #Assumes list is sorted.
  #Returns true is element is in list, else returns false
  #maybe it should return the element 
  def self.binary_search(list, element)

    def self.search(list, element, low, high)
      return list[low] == element if high == low
      mid = (high+low)/2

      return true if list[mid] == element

      if list[mid] > element
        return false if mid == low #nothing left to search
        search(list, element, low, mid-1)
      else
        search(list, element, mid+1, high)
      end
    end

    return false if list.size == 0
    search(list, element, 0, list.size-1)
  end
end
