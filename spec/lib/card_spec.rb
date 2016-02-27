require "spec_helper"

RSpec.describe Card do
  let(:card1) { Card.new(9, '♦') }
  let(:card2) { Card.new('K', '♥') }
  let(:card3) { Card.new('A', '♣') }

  it "has a rank" do
    expect(card1.rank).to eq(9)
    expect(card2.rank).to eq('K')
  end

  it "has a suit" do
    expect(card1.suit).to eq('♦')
  end

  it "for pip cards value is the pip" do
    expect(card1.value).to eq(9)
  end

  it "evaluates face cards to have a value of 10" do
    expect(card2.value).to eq(10)
  end


end
