module ConvertToBinary
  def self.convert_to_binary(number)
    result = ''

    begin
      result = (number%2).to_s + result
      number = number/2
    end while number > 0

    result
  end

  def self.convert_to_base_ten(bin_rep)
    powers = bin_rep.size-1
    bin_rep_index = bin_rep.size-1
    result = 0

    (0...bin_rep.size).each do |pwr|
      result += (bin_rep[bin_rep_index].to_i*2**pwr)
      bin_rep_index -= 1
    end

    result
  end

  def self.convert_to_binary_set_length(number, num_digits)
    result = ''

    while number > 0
      result = (number%2).to_s + result
      number = number/2
    end

    raise ArgumentError, "Not enough digits." if result.size > num_digits

    (result.size+1..num_digits).each { result = '0' + result }

    result
  end
end
