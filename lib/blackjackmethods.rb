require_relative "deck"
require_relative "hand"
require_relative "card"

deck = Deck.new

player_cards = deck.deal(2)
player = Hand.new(player_cards)
player.cards.each do |card|
  puts "Player was dealt #{card.name}"
end
print "Player score: #{player.calculate_score}\n"

while true
  print "Hit or Stand(H/S): "
  input = gets.chomp.downcase
  if input == 'h'
    #hit
    player.cards << deck.hit
    #binding.pry
    if player.busted?
      puts "You busted yo!"
      break
    else
      print "Player was dealt: #{player.cards.last.name}\n"
      print "Player score: #{player.calculate_score}\n"
    end
  elsif input == 's'
    break
  else
    puts "Not a valid input!"
  end
end


  computer_cards = deck.deal(2)
  computer = Hand.new(computer_cards)
  if !player.busted?
    computer.cards.each do |card|
      puts "Computerwas dealt #{card.name}"
    end
    while true
      if computer.busted?
        "computer busted! You win!"
        break
        exit
      elsif computer.calculate_score >= 17 && computer.calculate_score <= 21
        print "Computer score: #{computer.calculate_score}\n"
        break
      else
        computer.cards << deck.hit
      end
    end
  end

if !player.busted? && !computer.busted?
  if player.calculate_score > computer.calculate_score
    puts "You win!"
  elsif player.calculate_score < computer.calculate_score
    puts "You lose!"
  else
    puts "You tied!"
  end
end 


# Your code here...
# binding.pry
