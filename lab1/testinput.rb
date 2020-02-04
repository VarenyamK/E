# define class test
require './Cards.rb'
# created by Jacob Woods
class Test
  def initialize

    @card = []
  end


# enter the 3 locations of the cards the user wants to try and the 12 card array
  def check_input(var1, var2, var3 , delt) 
    # add user designated card to 3 card check array
    @card[0] = delt[var1]
    @card[1]= delt[var2]
    @card[2] = delt[var3]

    # set check to true
    check = true

    # check every card that it doesnt have a double
    (0..2).each do |j|
      # use count to keep track of double
      count = 0
      # set strings to compare if equal
      t = @card[j].number.to_s
      s = @card[0].number.to_s

      # compare for each of the 3 cards
      if (t <=> s).zero?
        # add to count if they are the same
        count += 1
      end

      s = @card[1].number.to_s
      if (t <=> s).zero?
        count += 1
      end

      s = @card[2].number.to_s
      if (t <=> s).zero?
        count += 1
      end

      # check for every loop if there is a double then set check
      if count == 2
        check = false
      end
    end

    (0..2).each do |j|
      # use count to keep track of double
      count = 0
      # set strings to compare if equal
      t = @card[j].shape.to_s
      s = @card[0].shape.to_s

      # compare for each of the 3 cards
      if (t <=> s).zero?
        # add to count if they are the same
        count += 1
      end

      s = @card[1].shape.to_s
      if (t <=> s).zero?
        count += 1
      end

      s = @card[2].shape.to_s
      if (t <=> s).zero?
        count += 1
      end

      # check for every loop if there is a double then set check
      if count == 2
        check = false
      end
    end

    (0..2).each do |j|
      # use count to keep track of double
      count = 0
      # set strings to compare if equal
      t = @card[j].color.to_s
      s = @card[0].color.to_s

      # compare for each of the 3 cards
      if (t <=> s).zero?
        # add to count if they are the same
        count += 1
      end

      s = @card[1].color.to_s
      if (t <=> s).zero?
        count += 1
      end

      s = @card[2].color.to_s
      if (t <=> s).zero?
        count += 1
      end

      # check for every loop if there is a double then set check
      if count == 2
        check = false
      end
    end

    (0..2).each do |j|
      # use count to keep track of double
      count = 0
      # set strings to compare if equal
      t = @card[j].shading.to_s
      s = @card[0].shading.to_s

      # compare for each of the 3 cards
      if (t <=> s).zero?
        # add to count if they are the same
        count += 1
      end

      s = @card[1].shading.to_s
      if (t <=> s).zero?
        count += 1
      end

      s = @card[2].shading.to_s
      if (t <=> s).zero?
        count += 1
      end

      # check for every loop if there is a double then set check
      if count == 2
        check = false
      end
    end

    # return check
    check
  end
end
