require_relative 'test_helper'

class ConvertToBinaryTest < Minitest::Test
  def test_return_binary_for_zero
    assert_equal '0', ConvertToBinary.convert_to_binary(0)
  end

  def test_return_binary_for_one
    #skip
    assert_equal '1', ConvertToBinary.convert_to_binary(1)
  end

  def test_return_binary_for_two
    #skip
    assert_equal '10', ConvertToBinary.convert_to_binary(2)
  end

  def test_return_binary_for_three
    #skip
    assert_equal '11', ConvertToBinary.convert_to_binary(3)
  end

  def test_return_binary_for_25
    #skip
    assert_equal '11001', ConvertToBinary.convert_to_binary(25)
  end

  def test_return_base_10_bin_rep_size
    skip
    bin_rep = '11001'
    assert_equal 5, ConvertToBinary.convert_to_base_ten(bin_rep)
  end

  def test_return_base_10_for_bin_rep_11001
    #skip
    bin_rep = '11001'
    assert_equal 25, ConvertToBinary.convert_to_base_ten(bin_rep)
  end

  def test_return_base_10_for_bin_rep_01111
    #skip
    bin_rep = '01111'
    assert_equal 15, ConvertToBinary.convert_to_base_ten(bin_rep)
  end

  def test_return_base_10_for_bin_rep_1
    #skip
    bin_rep = '1'
    assert_equal 1, ConvertToBinary.convert_to_base_ten(bin_rep)
  end

  def test_return_base_10_for_bin_repo_0
    #skip
    bin_rep = '0'
    assert_equal 0, ConvertToBinary.convert_to_base_ten(bin_rep)
  end
end
