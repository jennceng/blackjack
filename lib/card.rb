class Card
  attr_reader :rank, :suit, :name
  attr_accessor :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = nil
    @name = "#{rank}#{suit}"
  end

  def facecard?(rank)
    ['J', 'Q', 'K'].include?(rank)
  end

  def is_ace?(rank)
    rank == 'A'
  end

  def value
    if facecard?(@rank)
      @value = 10
    elsif is_ace?(@rank)
      @value = 0
    else
      @value = @rank
    end
  end


end
