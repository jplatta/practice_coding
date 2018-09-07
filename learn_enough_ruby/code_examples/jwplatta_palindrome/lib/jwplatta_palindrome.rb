require "jwplatta_palindrome/version"

class String
  # Returns true for a palindrome, false otherwise.
  def palindrome?
    processed_content == processed_content.reverse
  end
  
  # def letters
  #   theLetters = []
  #   for i in 0..(self.length - 1) do
  #     if self[i].match(/[a-zA-Z]/)
  #       theLetters << self[i]
  #     end
  #   end
    
  #   theLetters.join
  # end

  # def letters
  #   self.chars.select { |c| c.match(/[a-z]/i) }.join
  # end

  # def letters
  #   self.scan(/[a-z]/i).join
  # end
  
  private
  
  # Returns content for palindrome testing.
  def processed_content
    self.scan(/[a-z]/i).join.downcase
  end
end
