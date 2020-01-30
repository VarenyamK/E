#define class Card
# Author @Varenyam Kaushik
class Card
  attr_accessor(:number, :color, :shape, :shading)

  def initialize(number, color, shape, shading)
    #defines attributes of a card
    @number = number
    @color = color
    @shape = shape
    @shading = shading
  end
  #allows to print out card values
  def print_card
    puts "#{@number} #{@color} #{@shape} #{@shading}"
  end
end


class Deck
  def initialize
    #defines the allowed parameter values for deck
    @numbers = [1, 2, 3]
    @colors = ['red', 'green', 'blue']
    @shapes = ['diamond', 'oval', 'squiggle']
    @shadings = ['hollow', 'shaded', 'filled']
    #initialize array that stores cards in the deck
    @cards = []
    #initializes the deck of cards in an array using for each loops
    @numbers.each do |number|
      @colors.each do |color|
        @shapes.each do |shape|
          @shadings.each do |shading|
           @cards << Card.new(number, color, shape, shading)
         end
        end
      end
    end
    #shuffles cards deck
    @cards.shuffle!
  end
  #deals the cards
  def deal(number_of_cards)
    #only deals the amount of cards left in deck if deck has less than 12 left, otherwise deals 12
    if @cards.length < 12
      @cards.length.times{@cards.shift.print_card}
    else
      number_of_cards.times {@cards.shift.print_card}
    end
  end
  #provides the number of cards left for debugging purposes
  def cards_left
    @cards.length
  end
end

#for testing and debugging purposes ot make sure the cards are printed right and shuffled
deck = Deck.new
puts deck.cards_left
#deals 12 cards
deck.deal(12)
puts deck.cards_left
deck.deal( 12)
puts deck.cards_left
deck.deal( 12)
puts deck.cards_left
deck.deal( 12)
puts deck.cards_left
deck.deal( 12)
puts deck.cards_left
deck.deal( 12)
puts deck.cards_left
deck.deal( 12)

#prints the number of cards left after the first dealing
puts deck.cards_left