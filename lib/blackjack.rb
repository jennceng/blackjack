require_relative "deck"
require_relative "hand"
require_relative "card"


class Blackjack
  attr_accessor :player, :computer, :deck

  def initialize
    @deck = Deck.new
    @player = Hand.new(@deck.deal(2))
    @computer = Hand.new(@deck.deal(2))
  end

  def initial_player_info
    hand_info = ""
    player.cards.each do |card|
      hand_info += "Player was dealt #{card.name}\n"
    end
    hand_info += "Player's score is #{player.calculate_score}\n"
    hand_info
  end

  def prompt_player
    while true
      print "Hit or Stand(H/S): "
      input = gets.chomp.downcase
      if input == 'h'
        hit(player)
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
  end

  def hit(hand)
    hand.cards << @deck.deal(1).first
  end

  def computers_turn
    @computer.cards.each do |card|
      puts "Computer was dealt #{card.name}"
    end
    while true
      if computer.busted?
        puts "computer busted! You win!"
        break
      elsif computer.calculate_score >= 17 && computer.calculate_score <= 21
        print "Computer score: #{computer.calculate_score}\n"
        break
      else
        hit(computer)
      end
    end
  end

  def determine_winner
    if player.calculate_score > computer.calculate_score
      puts "Player wins!"
    elsif player.calculate_score < computer.calculate_score
      puts "Computer wins!"
    else
      puts "Tie!"
  end

end


new_round = Blackjack.new
print new_round.initial_player_info
new_round.prompt_player

if !new_round.player.busted?
  new_round.computers_turn
end

if !new_round.player.busted? && !new_round.computer.busted?
  new_round.determine_winner
end

end
