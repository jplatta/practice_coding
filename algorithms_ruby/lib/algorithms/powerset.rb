require_relative './convert_to_binary'

module Powerset
  def self.get_powerset(list)
    power_of_two = 2**(list.size)

    powerset = (0...power_of_two).map do |i|
      bin_rep = ConvertToBinary.convert_to_binary_set_length(i, list.size)

      subset = []
      (0...list.size).each { |j| subset << list[j] if bin_rep[j] == '1' }

      subset
    end
  end
end
