require_relative 'test_helper'

class FindFlrSqrtTest < Minitest::Test
  def test_finding_floor_sqrt_150
    result = Algorithms.find_flr_sqrt(150)
    assert_equal 12, result
  end

  def test_finding_floor_sqrt_for_perfect_square
    result = Algorithms.find_flr_sqrt(100)
    assert_equal 10, result
  end

  def test_finding_floor_sqrt_for_small_number
    result = Algorithms.find_flr_sqrt(13)
    assert_equal 3, result
  end

  def test_finding_floor_sqrt_for_really_small_number
    result = Algorithms.find_flr_sqrt(3)
    assert_equal 1, result
  end

  def test_finding_floor_sqrt_for_large_number
    result = Algorithms.find_flr_sqrt(1000001)
    assert_equal 1000, result
  end
end
