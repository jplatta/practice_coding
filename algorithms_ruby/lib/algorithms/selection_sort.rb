
module Algorithms
  def self.selection_sort(list)
    start = 0

    begin
      (0...list.size).each do |i|
        list[start], list[i] = list[i], list[start] if list[start] < list[i]
      end

      start += 1
    end until start >= list.size

    list
  end
end
