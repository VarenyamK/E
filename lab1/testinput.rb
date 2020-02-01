#define class test
require './Cards.rb'
# created by Jacob Woods
class Test
  def initialize

    @card = []
  end


# enter the three locations of the cards the user wants to try and the 12 card array
def check_input(var1, var2, var3 , delt)

  #add user designated card to 3 card check array
  @card[0] = delt[var1]
  @card[1]= delt[var2]
  @card[2] = delt[var3]

  #set check to true
  check = true

    #check every card that it doesnt have a double
  for j in 0..2 do
      #use count to keep track of double
      count = 0
      #set strings to compare if equal
      t = @card[j].get_num.to_s
      s = @card[0].get_num.to_s

      #compare for each of the 3 cards
			if (t <=> s) == 0
        #add to count if they are the same
        count = count + 1

			end

      s = @card[1].get_num.to_s
			if (t <=> s) == 0
         count = count + 1

			end
      s = @card[2].get_num.to_s
      if (t <=> s) == 0
        count = count + 1
      end
      #check for every loop if there is a double then set check
      if count == 2
        check = false

      end
  end

  for j in 0..2 do
    #use count to keep track of double
    count = 0
    #set strings to compare if equal
    t = @card[j].get_shape.to_s
    s = @card[0].get_shape.to_s

    #compare for each of the 3 cards
    if (t <=> s) == 0
      #add to count if they are the same
      count = count + 1

    end

    s = @card[1].get_shape.to_s
    if (t <=> s) == 0
      count = count + 1

    end
    s = @card[2].get_shape.to_s
    if (t <=> s) == 0
      count = count + 1
    end
    #check for every loop if there is a double then set check
    if count == 2
      check = false

    end
  end

  for j in 0..2 do
    #use count to keep track of double
    count = 0
    #set strings to compare if equal
    t = @card[j].get_color.to_s
    s = @card[0].get_color.to_s

    #compare for each of the 3 cards
    if (t <=> s) == 0
      #add to count if they are the same
      count = count + 1

    end

    s = @card[1].get_color.to_s
    if (t <=> s) == 0
      count = count + 1

    end
    s = @card[2].get_color.to_s
    if (t <=> s) == 0
      count = count + 1
    end
    #check for every loop if there is a double then set check
    if count == 2
      check = false

    end
  end

  for j in 0..2 do
    #use count to keep track of double
    count = 0
    #set strings to compare if equal
    t = @card[j].get_shade.to_s
    s = @card[0].get_shade.to_s

    #compare for each of the 3 cards
    if (t <=> s) == 0
      #add to count if they are the same
      count = count + 1

    end

    s = @card[1].get_shade.to_s
    if (t <=> s) == 0
      count = count + 1

    end
    s = @card[2].get_shade.to_s
    if (t <=> s) == 0
      count = count + 1
    end
    #check for every loop if there is a double then set check
    if count == 2
      check = false

    end
  end


    #return check
    check
end

end



			

