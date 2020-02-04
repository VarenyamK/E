# The Game of Set
require './Cards.rb'
require './testinput.rb'

#method to check for duplicate inputs
def checkduplicate(var1, var2, var3)
  check =  true
  #check each variation to make sure it isnt the same as any other variable
  if var1 == var2
    check = false
  end

  if var1 == var3
    check = false
  end

  if var2 == var3
    check = false
  end
  #error message
  if check == false
    puts 'do not put duplicate numbers'
  end
  check
end

#check if the variables are out of bounds of the delt hand
def checkbounds (var1, var2 , var3, arr)
  #get array of all the indexes possible
  acheck = (0..(arr.length()-1)).to_a
  # set the variable
  tf = true

  # check each variable if it is not in this range
  unless acheck.include? var1
    tf = false
    puts 'variable 1 out of bounds'
  end

  unless acheck.include? var2
    tf = false
    puts 'variable 2 out of bounds'
  end

  unless acheck.include? var3
    tf = false
    puts 'variable 3 out of bounds'
  end
  #return the boolean check
  tf
end

# method that takes in 12 card hand and prints a hint
def hint(cards12)
  arr12 = (0..(cards12.length()-1)).to_a
  allSets = Array.new
  allSets = arr12.combination(3).to_a

  i = 0
  while i < allSets.length()
    checkHint = Test.new
    comb = Array.new
    comb = allSets[i]
    crd1 = comb[0]
    crd2 = comb[1]
    crd3 = comb[2]
    isSet = checkHint.check_input(crd1, crd2, crd3, cards12)
    break if isSet

    i += 1
  end
  puts "#{crd1} #{crd2} #{crd3}"
end

deck = Deck.new
check = Test.new

totalTime = 0
hints = 0

# initialize hand of 12
hand = []
deck.deal(hand)

# get to point counter
points = 0

# stay playing until out of cards to deal
while deck.cards_left > 3

  # gets current time
  timeNow = Time.now
  #get variables for the user checks
  checkb = false
  checkd = false
  # while loop to loop till correct inputs
  while (checkb == false) || (checkd == false)

    # print the dealt hand
    display_hand(hand)

    # ask for user input
    puts 'Enter 3 numbers with enter inbetween each to say which cards you want(n if there is not a set and q to quit game): '
    puts 'Stuck? press h for a hint. You will only get 3 hints per game so use them wisely'

    # get input from user
    var1 = gets.chomp
    # if user needs a hind, hint will be given, up to 3 hints per game
    unless (var1 <=> 'h') != 0
      # makes sure user has hints left
      if hints < 3
        puts 'Hint: the following set of 3 cards is a set'
        hint(hand)
      elsif hints >= 3
        #if user used all 3 hints, no more are available
        puts 'Sorry, you used all 3 hints this game. Enter 3 cards with enter inbetween each or n if there is no set, q to quit'
      end
      hints += 1
      var1 = gets.chomp
    end

    # check for quit statement
    if (var1 <=> 'q').zero?
      # exit game loop
      exit!
      # check for no set statement
    elsif (var1 <=> 'n').zero?
      # re-deal hand
      deck.deal(hand)
      # skip rest of loop
      next
    end

    # get variables
    var1 = var1.to_i
    var2 = gets.to_i
    var3 = gets.to_i
    # check if user put duplicates which is not allowed
    checkd = checkduplicate(var1,var2,var3)
    # if statement to keep from checking the same numbers (will return true if this happens)
    if checkd == true
      # check if variables are out of range
      checkb = checkbounds(var1, var2, var3, hand)
    end

  end
  # calculates time taken for user to respond
  timeAfter = Time.now
  timeTaken = timeAfter - timeNow

  # check the user input to see if it is a set
  checkuser = check.check_input(var1, var2, var3, hand)
  # display if it is a set
  puts checkuser

  # if it is a set remove the cards from the deck and give user a point
  next unless checkuser

  # displays time taken to find set
  puts "#{timeTaken} seconds taken to find a set"
  totalTime += timeTaken

  str1 = hand[var1]
  str2 = hand[var2]
  str3 = hand[var3]

  hand.delete(str1)
  hand.delete(str2)
  hand.delete(str3)

  #if the array has been added to (by there not being a set) do not add more cards
  if (hand.length() < 12)
    # adding cards to hand
    puts ' adding cards'
    deck.deal(hand)
  end
  # add points
  points += 1
end

# display total points
puts 'total points earned: '
puts points
# displays total time taken
puts "#{totalTime} is the total time taken"