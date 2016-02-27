class Hand
  attr_reader :cards

  def initialize (cards)
    @cards = cards
  end

  def calculate_score
    score = 0
    aces = 0
    @cards.each do |card|
      if card.is_ace?(card.rank)
        aces += 1
      else
      score += card.value
      end
    end
    aces.times do
      if score <= 10
        score += 11
      else
        score += 1
      end
    end
    score
  end

  def busted?
    calculate_score > 21
  end

  def hit(card)
    @cards << card
  end

end
