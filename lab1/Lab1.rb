# The Game of Set
require './Cards.rb'
require './testinput.rb'

deck = Deck.new
check = Test.new

totalTime = 0

# initialize hand of 12
hand = []
deck.deal(hand)
#get to point counter
points = 0
# Delete Later: All future deals will add 3 cards to the hand
# Case 1: Match found. Hand size is 9, so add 3 more cards.
# Case 2: Match not found. Add 3 more cards. Hand size now 15. Repeat dealing 3
# if necessary

#stay playing until out of cards to deal
while deck.cards_left > 3
  #print the delt hand
  display_hand(hand)

  #gets current time
  timeNow = Time.now

  #ask for user input
  puts 'enter 3 numbers with enter inbetween each to say which cards you want(n if there is not a set and q to quit game): '

  #get input from user
  var1 = gets.chomp
  #check for quit statement
  if (var1 <=> 'q') == 0
    #exit game loop
    break
    #check for no set statement
  elsif (var1 <=> 'n') == 0
    #redeal hand
    hand = []
    deck.deal(hand)
    #skip rest of loop
    next
  end

  #get variables
  var1 = var1.to_i
  var2 = gets.to_i
  var3 = gets.to_i

  #calculates time taken for user to respond
  timeAfter = Time.now
  timeTaken = timeAfter - timeNow

  #check the user input to see if it is a set
  checkuser = check.check_input(var1,var2,var3, hand)
  #display if it is a set
  puts checkuser

  #if it is a set remove the cards from the deck and give user a point
  if checkuser
     #displays time taken to find set
    puts "#{timeTaken} seconds taken to find a set"
    totalTime = totalTime + timeTaken    

    str1 = hand[var1]
    str2 = hand[var2]
    str3 = hand[var3]

    hand.delete(str1)
    hand.delete(str2)
    hand.delete(str3)
    #adding cards to hand
    puts ' adding cards'
    deck.deal(hand)
    #add points
    points = points + 1
  end

end
#display total points
puts 'total points earned: '
puts points
#displays total time taken
puts "#{totalTime} is the total time taken"