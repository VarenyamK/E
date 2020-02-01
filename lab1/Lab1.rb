# The Game of Set
require './Cards.rb'

deck = Deck.new

# initialize hand of 12
hand = []
deck.deal(hand)
# Delete Later: All future deals will add 3 cards to the hand
# Case 1: Match found. Hand size is 9, so add 3 more cards.
# Case 2: Match not found. Add 3 more cards. Hand size now 15. Repeat dealing 3
# if necessary

display_hand(hand)