require_relative 'test_helper'

class AlgorithmsTest < Minitest::Test

  def test_merge_sort
    skip
    list = [5,7,1,3,9]
    sorted_list = Algorithms.merge_sort(list)
    assert_equal [1,3,5,7,9], sorted_list
  end

  def test_selection_sort
    skip
    list = [5,7,1,3,9]
    sorted_list = Algorithms.selection_sort(list)
    assert_equal [1,3,5,7,9], sorted_list
  end

  def test_binary_search_is_in_list
    skip
    list = [1,2,3,4,56,1808,2390]
    is_in_list = Algorithms.binary_search(list, 56)
    assert_equal true, is_in_list
  end

  def test_binary_search_is_not_in_list
    skip
    list = [1,2,3,4,56,1808,2390]
    is_not_in_list = Algorithms.binary_search(list, 59)
    assert_equal false, is_not_in_list
  end

  def test_quick_sort
    skip
    list = [5,7,1,3,9]
    sorted_list = Algorithms.quick_sort(list, 0, list.size-1)
    assert_equal [1,3,5,7,9], sorted_list
  end
end
