module Algorithms
  def self.find_flr_sqrt(number=0)

    def self.search_sqrt(number, high , low)

      guess = (high-low)/2 + low

      return guess if guess**2 == number

      nxt_number = guess+1

      if (guess**2 < number) && (nxt_number**2 > number)
        return guess
      elsif guess**2 > number
        search_sqrt(number, guess, low)
      else
        search_sqrt(number, high, guess)
      end
    end

    return number if number == 0

    search_sqrt(number, number, 0)
  end
end
