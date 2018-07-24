require_relative 'test_helper'

class QuickSortTest < Minitest::Test

  def test_quick_sort_array_of_lowercase_letters
    letters = ["b", "s", "w", "l", "m", "z"]
    assert_equal ["b", "l", "m", "s", "w", "z"], Algorithms.quick_sort(letters, 0, letters.size-1)
  end
end
