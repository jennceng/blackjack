require "spec_helper"

RSpec.describe Hand do
  # Your tests here
  let(:hand) { Hand.new([Card.new(10, "♦"), Card.new('J', "♠")]) }
  let(:hand2) { Hand.new([Card.new('A', "♦"), Card.new(9, "♠")]) }
  let(:hand3) { Hand.new([Card.new('A', "♦"), Card.new('A', "♠"), Card.new('A', "♣")]) }
  let(:hand4) { Hand.new([Card.new('A', "♦"), Card.new(4, "♠"), Card.new(5, "♠")])}
  let(:hand5) { Hand.new([Card.new(10, "♦"), Card.new('J', "♠"), Card.new(9,"♠")]) }



  describe "#calculate_score" do
    it "correctly calculates a hand with facecards" do
      expect(hand.calculate_score).to eq 20
    end

    it "correctly calculates a hand with one ace that will not bust" do
      expect(hand2.calculate_score).to eq 20
    end

    it "correctly handles calculating hands with more than one ace" do
      expect(hand3.calculate_score).to eq 13
    end

    it "correctly changes ace value when hit adds a card that would bust" do
      expect(hand4.calculate_score).to eq 20
      hand4.cards << (Card.new(6, "♠"))
      expect(hand4.calculate_score).to eq 16
    end

  end

  describe "#busted" do
    it "evaluates true if a hand has busted" do
      expect(hand5.busted?).to eq true
    end
    it "evaluates false if a hand has not busted" do
      expect(hand4.busted?).to eq false
    end
  end




end
