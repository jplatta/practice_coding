require_relative 'test_helper'

class TestDeckOfCards < Minitest::Test
  def test_create_card_suit_attribute
    card = Algorithms::Card.new("spade", 10)

    assert_equal "spade", card.suit
  end

  def test_create_card_value_attribute
    card = Algorithms::Card.new("spade", 10)

    assert_equal 10, card.value
  end

  def test_create_deck_init_card_array
    deck = Algorithms::Deck.new

    assert_equal 0, deck.cards.size
  end

  def test_create_complete_deck
    deck = Algorithms::Deck.new
    deck.generate_standard_deck
    assert_equal 52, deck.cards.size
  end

  def test_shuffling_deck
    deck = Algorithms::Deck.new
    deck.generate_standard_deck

    unshuffled_cards = deck.cards

    deck.shuffle_deck

    shuffled_cards = deck.cards

    refute unshuffled_cards == shuffled_cards
  end

  def test_draw_card
    deck = Algorithms::Deck.new
    deck.generate_standard_deck
    card = deck.draw_card
    assert_equal "spade", card.suit
    assert_equal 2, card.value
    assert_equal 51, deck.cards.size
  end

  def test_create_new_hand
    hand = Algorithms::Hand.new
    assert_equal 0, hand.cards.size
  end

  def test_add_card_to_hand
    hand = Algorithms::Hand.new
    deck = Algorithms::Deck.new
    deck.generate_standard_deck
    card = deck.draw_card

    hand.add_card_to_hand(card)
    assert_equal 1, hand.cards.size
    assert_equal 51, deck.cards.size
  end

  def test_discard_hand
    hand = Algorithms::Hand.new
    deck = Algorithms::Deck.new
    deck.generate_standard_deck

    card = deck.draw_card
    hand.add_card_to_hand(card)

    assert_equal 1, hand.cards.size

    hand.discard_hand

    assert_equal 0, hand.cards.size
  end

end
