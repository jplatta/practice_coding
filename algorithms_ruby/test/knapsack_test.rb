require_relative './test_helper'

class KnapsackTest < Minitest::Test
  def test_create_item_with_name
    new_item = Knapsack::Item.new('test_item', 0, 0)
    assert_equal 'test_item', new_item.name
  end

  def test_create_item_with_value
    new_item = Knapsack::Item.new('test_item', 100, 0)
    assert_equal 100, new_item.value
  end

  def test_create_item_with_weight
    new_item = Knapsack::Item.new('test_item', 100, 125)
    assert_equal 125, new_item.weight
  end

  def test_item_to_string
    new_item = Knapsack::Item.new('test_item', 100, 125)
    assert_equal '<test_item, 100, 125>', new_item.to_s
  end

  def test_item_weight_inverse
    new_item = Knapsack::Item.new('test_item', 100, 125)
    assert_equal 0.008, new_item.weight_inverse
  end

  def test_density
    new_item = Knapsack::Item.new('test_item', 100, 125)
    assert_equal 0.8, new_item.density
  end
end
