require_relative 'test_helper'

class PowersetTest < Minitest::Test
  def test_powerset_of_empty_list
    empty_list = []
    assert_equal [[]], Powerset.get_powerset(empty_list)
  end

  def test_powerset_of_list_with_one_element
    #skip
    short_list = [1]
    assert_equal [[],[1]], Powerset.get_powerset(short_list)
  end

  def test_powerset_of_list_with_two_elements
    #skip
    longer_list = [1,2]
    assert_equal [[],[2],[1],[1,2]], Powerset.get_powerset(longer_list)
  end

  def test_powerset_of_list_with_three_elements
    #skip
    still_longer_list = [1,2,3]
    assert_equal [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]], Powerset.get_powerset(still_longer_list)
  end
end
