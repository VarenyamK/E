# The Game of Set
require './Cards.rb'
require './testinput.rb'
require './Players.rb'

# method to check for duplicate inputs
def checkduplicate(var1, var2, var3)
  check =  true
  # check each variation to make sure it isnt the same as any other variable
  if var1 == var2
    check = false
  end

  if var1 == var3
    check = false
  end

  if var2 == var3
    check = false
  end
  # error message
  if check == false
    puts 'do not put duplicate numbers'
  end
  check
end

# check if the variables are out of bounds of the delt hand
def checkbounds (var1, var2 , var3, arr)
  # get array of all the indexes possible
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
  # return the boolean check
  tf
end

# gets a valid player id and returns it
def check_player_id(players_arr)
  check = false
  puts 'Enter player number: '
  id = gets.chomp
  while !check
    if (id.to_i > 0 && id.to_i <= players_arr.length().to_i)
      check = true
    else
      puts 'Invalid player number.'
      puts 'Enter player number: '
      id = gets.chomp
    end
  end
  id
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

play_again = true

# initialize players list
players = []

puts 'Enter number of players: '
num_of_players = gets.to_i
player_number = 1

# adds players to the players list
while player_number <= num_of_players
  puts 'Enter player ' + player_number.to_s + '\'s name: '
  name = gets.to_s
  player = Player.new player_number, name
  players << player
  player_number += 1
end

# keep starting new games until player wants to stop
while play_again

  deck = Deck.new
  check = Test.new

  totalTime = 0
  hints = 0
  replay = true

  # initialize hand of 12
  hand = []
  deck.deal(hand)

  # stay playing until out of cards to deal
  while deck.cards_left > 3

    current_player = 0
    # gets current time
    timeNow = Time.now
    #get variables for the user checks
    checkb = false
    checkd = false
    # while loop to loop till correct inputs
    while (checkb == false) || (checkd == false)

      # print the dealt hand
      display_hand(hand)

      # pulls player from the player list based on the id entered
      answer_id = check_player_id(players)
      current_player = players[answer_id.to_i - 1]
      puts current_player.name + ' is the selected player'

      # ask for user input
      puts 'Enter first card number (or q to quit or n if there is no set):'
      puts 'Stuck? press h for a hint. You will only get 3 hints per game:'

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
        #hints += 1
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
      puts 'Enter second card number:'
      var2 = gets.to_i
      puts 'Enter first second card number:'
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
    if !checkuser
      puts "Invalid set"
    end
    #puts checkuser

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
    current_player.set += 1
    current_player.total_sets += 1
  end

  # display total points
  players.each do |player|
    puts player.name
    print 'Sets gotten this game: ' + player.set.to_s + ', '
    puts 'Total sets: ' + player.total_sets.to_s
    player.set = 0
  end

  # displays total time taken
  puts "#{totalTime} is the total time taken"

  # asks user if they want to play again
  puts 'Enter \'1\' to play again: '
  answer = gets.to_i
  if answer != 1
    play_again = false
    puts 'Thank you for playing!'
  end
end

winner = ' '
winner_sets = 0

# gets winner who has the most sets
players.each do |player|
  if player.total_sets.to_i > winner_sets.to_i
    winner = player.name
    winner_sets = player.total_sets
  end
end

puts 'The winner is ' + winner.to_s + ' with ' + winner_sets.to_s + ' sets!'
