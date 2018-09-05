class Phrase < String
  def processor(string)
    string.downcase
  end
  
  # Returns content for palindrome testing.
  def processed_content
    processor(self)
  end

#   def processed_content
#     self.downcase
#   end

  # Returns true for a palindrome, false otherwise.
  def palindrome?
    processed_content == processed_content.reverse
  end
end

class TranslatedPhrase < Phrase
  attr_accessor :translation

  def initialize(content, translation)
    super(content)
    @translation = translation
  end

  # Processes the translation for palindrome testing.
#   def processed_content
#     self.translation.downcase
#   end 
  def processed_content
    processor(translation)
  end
end

phrase = Phrase.new("Racecar")
puts phrase
if phrase.palindrome?
  puts '...is a palindrome.'
else
  puts '...is not a palindrome.' 
end

frase = TranslatedPhrase.new("recognize", "reconocer")
puts frase.palindrome?