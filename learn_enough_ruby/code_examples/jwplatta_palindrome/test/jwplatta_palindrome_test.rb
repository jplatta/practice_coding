require 'test_helper'

class JwplattaPalindromeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::JwplattaPalindrome::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_for_non_palindrome
    refute "apple".palindrome?
  end

  def test_for_plain_palindrome 
    assert "racecar".palindrome?
  end

  def test_mixed_case_palindrome
    assert "Racecar".palindrome?
  end

  # def test_letters_method
  #   assert_equal "Madam, I’m Adam.".letters, "MadamImAdam"
  # end

  def test_palindrome_with_punctuation
    assert "Madam, I’m Adam.".palindrome?
  end
end
