require "spec_helper"

describe Blackjack do
  let(:round1)  { Blackjack.new }

  describe ".new" do
    it "makes a new round of blackjack with a deck, player hand, and computer hand" do
      expect(round1.deck).to be_a(Deck)
      expect(round1.player).to be_a(Hand)
      expect(round1.computer).to be_a(Hand)
    end
  end

  describe "#initial_player_info" do
    new_round = Blackjack.new
    new_round.player = Hand.new([Card.new(9, '♦'), Card.new('A', '♣')])
    it "prints out the initial cards player was dealt" do
      expect(new_round.initial_player_info).to include("Player was dealt")
      expect(new_round.initial_player_info).to include("9♦")
      expect(new_round.initial_player_info).to include("A♣")
    end

    it "prints the player's initial best score" do
      expect(new_round.initial_player_info).to include("20")
    end
  end

  describe "#hit" do
    it "pops a card off the deck and deals it to hand" do
      top_card = round1.deck.cards[-1].value
      round1.hit(round1.player)
      expect(round1.player.cards.last.value).to eq (top_card)
    end
  end

  # how do i test for an infinite loop???
  # describe "#prompt_player" do
  #   it "prompts player for input" do
  #     expect{round1.prompt_player}.to output("Hit or Stand(H/S): ").to_stdout
  #   end
  # end


end
