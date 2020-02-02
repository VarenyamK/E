# Author @Varenyam Kaushik, Nick Connors

# define class Card
class Card
  attr_accessor(:number, :color, :shape, :shading)

  def initialize(number, color, shape, shading)
    # defines attributes of a card
    @number = number
    @color = color
    @shape = shape
    @shading = shading
  end

  # allows to print out card values
  def print_card
    card = "#{@number} #{@color} #{@shape} #{@shading}"
    if @color == 'red'
      puts card.red
    elsif @color == 'blue'
      puts card.blue
    elsif @color == 'green'
      puts card.green
    end
  end


end

# Define class Deck
class Deck
  def initialize
    # defines the allowed parameter values for deck
    @numbers = [1, 2, 3]
    @colors = %w[red green blue]
    @shapes = %w[diamond oval squiggle]
    @shadings = %w[hollow shaded filled]

    # initialize array that stores cards in the deck
    @cards = []

    # initializes the deck of cards in an array using for each loops
    @numbers.each do |number|
      @colors.each do |color|
        @shapes.each do |shape|
          @shadings.each do |shading|
            @cards << Card.new(number, color, shape, shading)
          end
        end
      end
    end
    # shuffles cards deck
    @cards.shuffle!
  end

  # deals the cards
  def deal(hand)
    # hand is 12 to start
    if hand.length.zero?
      12.times { hand.push(@cards.shift) }
    else
      # if match found or not, add 3 to hand
      3.times { hand.push(@cards.shift) }
    end
  end

  # provides the number of cards left for debugging purposes
  def cards_left
    @cards.length
  end
end

def display_hand(hand)
  i = 0
  hand.each do |c|
    print i.to_s + ": "
    c.print_card
    i = i + 1
  end
end

# Add method to String class to add color to terminal output
# Credit to Erik Skoglund: https://stackoverflow.com/a/11482430/8760155
class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def blue
    colorize(34)
  end
end

