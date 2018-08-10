module Algorithms

  #Assumes check is a string
  #Returns true if all the brackets in check are matching
  def self.check_matching_brackets(check='')

    bracket_indexes = (0...check.size).find_all do |i|
      check[i, 1] == "{" ||
      check[i, 1] == "}" ||
      check[i, 1] == "[" ||
      check[i, 1] == "]" ||
      check[i, 1] == "(" ||
      check[i, 1] == ")"
    end

    return true if bracket_indexes.size == 0 #no possibility of non-matching brackets
    return false if bracket_indexes.size%2 == 1 #odd number of brackets, brackets can't match

    brackets = []

    brackets = bracket_indexes.map { |i| check[i] }

    #[ "(", ")", "[", "]" ]
    #[ "(", "[", "]", ")" ]
    #[ "(", "[", "]", ")", "{", "}" ]

    #remove the brackets right next to each other
    map_brackets(brackets)

=begin
    front = 0
    back = enclosed_brackets.size-1

    while front < back
      return false unless match_bracket(enclosed_brackets[front]) == enclosed_brackets[back]
      front += 1
      back -= 1
    end

    true
=end
  end

  def self.map_brackets(brackets)
    enclosed_brackets = []
    index = 0

    puts brackets.inspect

    while index < brackets.size
      if left?(brackets[index]) && right?(brackets[index+1])
        if match_bracket(brackets[index]) == brackets[index+1]
          index += 2
        else
          return false
        end
      else
        enclosed_brackets << brackets[index]
        index += 1
      end
    end

    if enclosed_brackets.size == 0
      true
    elsif enclosed_brackets.size == 1
      false
    elsif enclosed_brackets.size == 2
      match_bracket(enclosed_brackets[0]) == enclosed_brackets[1]
    else
      map_brackets(enclosed_brackets)
    end
  end

  def self.left?(bracket)
    case bracket
    when "("
      true
    when "{"
      true
    when "["
      true
    else
      false
    end
  end

  def self.right?(bracket)
    case bracket
    when ")"
      true
    when "}"
      true
    when "]"
      true
    else
      false
    end
  end

  def self.match_bracket(front_bracket)
    if front_bracket == "{"
      "}"
    elsif front_bracket == "("
      ")"
    else
      "]"
    end
  end
end
