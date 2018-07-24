#Assumes a typical 52 card deck
#Deck actions: draw, shuffle
## Deck will hold an array of cards
#4 suits: clubs, hearts, diamonds, spades
#13 cards/1 suit
## Each card will have a suit and a value
#face cards: Ace, King, Queen, Jack
#number cards: 2, 3, 4, 5, 6, 7, 8, 9, 10
#Hand
## A hand gets its cards from the deck and can have 0 or more cards until the deck is empty
#game
## Create an instance of Deck and instances of 1 or more Hands

module Algorithms
  STANDARD_DECK = [
    ["spade", 2],
    ["spade" , 3],
    ["spade" , 4],
    ["spade" , 5],
    ["spade" , 6],
    ["spade" , 7],
    ["spade" , 8],
    ["spade" , 9],
    ["spade" , 10],
    ["spade" , "jack"],
    ["spade" , "queen"],
    ["spade" , "king"],
    ["spade" , "ace"],
    ["clubs", 2],
    ["clubs" , 3],
    ["clubs" , 4],
    ["clubs" , 5],
    ["clubs" , 6],
    ["clubs" , 7],
    ["clubs" , 8],
    ["clubs" , 9],
    ["clubs" , 10],
    ["clubs" , "jack"],
    ["clubs" , "queen"],
    ["clubs" , "king"],
    ["clubs" , "ace"],
    ["heart", 2],
    ["heart" , 3],
    ["heart" , 4],
    ["heart" , 5],
    ["heart" , 6],
    ["heart" , 7],
    ["heart" , 8],
    ["heart" , 9],
    ["heart" , 10],
    ["heart" , "jack"],
    ["heart" , "queen"],
    ["heart" , "king"],
    ["heart" , "ace"],
    ["diamond", 2],
    ["diamond" , 3],
    ["diamond" , 4],
    ["diamond" , 5],
    ["diamond" , 6],
    ["diamond" , 7],
    ["diamond" , 8],
    ["diamond" , 9],
    ["diamond" , 10],
    ["diamond" , "jack"],
    ["diamond" , "queen"],
    ["diamond" , "king"],
    ["diamond" , "ace"]
  ]

  class Card
    attr_accessor :suit, :value

    def initialize(suit, value)
      @suit = suit
      @value = value
    end
  end

  class Deck
    attr_reader :cards

    def initialize
      @cards = []
    end

    def generate_standard_deck
      STANDARD_DECK.each do |card|
        @cards << Card.new(card[0], card[1])
      end
    end

    def shuffle_deck
      @cards = @cards.shuffle
    end

    def draw_card
      card = @cards.first
      @cards.delete_at(0)
      card
    end

  end

  class Hand
    attr_reader :cards

    def initialize
      @cards = []
    end

    def add_card_to_hand(card)
      @cards << card
    end

    def discard_hand
      @cards = []
    end
  end
end
