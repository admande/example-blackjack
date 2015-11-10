require "pry"
require_relative '../blackjack'

describe Deck do
  let(:deck) { Deck.new } # creates a variable that can be used for tests

  describe "#build_deck" do
    it "builds a deck of 52 cards" do
      expect(deck.cards.size).to eq 52
    end

    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end

    it "shuffles deck aftering being built" do
      expect(deck.cards.sort).to_not eq deck.cards

      # it is good not to rely on negative tests alone
      # so we assert that after sorting the deck it looks like we expect
      expect(deck.cards.sort[0..1]).to eq ["10♠", "10♣"]
    end
  end

  describe "#deal" do
    it "removes correct number of cards" do
      start_size = deck.cards.size
      finish_size = start_size - 2

      deck.deal(2)

      expect(deck.cards.size).to eq finish_size
    end

    it "deals the top card in the deck" do
      correct_card = deck.cards[-1]
      expect(deck.deal(1)).to eq [correct_card]
    end
  end
end

# These will be useful for making different hands
# '♦', '♣', '♠', '♥'

describe Hand do
  let(:hand) { Hand.new(["10♦", "J♥"]) }
  let(:crazy_hand) { Hand.new(["A♦", "A♥"]) }
  let(:diff_hand) { Hand.new(["A♦", "A♥", "A♣"]) }
  let(:final_hand) { Hand.new(["A♦", "K♥"]) }
  let(:one_more_hand) { Hand.new(["6♦", "K♥"]) }


  describe "#calculate_hand" do
    it "adds up the value of the cards" do
      hand.calculate_hand
      expect(hand.score).to eq(20)
    end

    it "should not make two aces both equal to 11" do
      crazy_hand.calculate_hand
      expect(crazy_hand.score).to eq(12)
    end

    it "should evaluate three-card hands" do
      diff_hand.calculate_hand
      expect(diff_hand.score).to eq(13)
    end

    it "should add up the best value of the cards" do
      final_hand.calculate_hand
      expect(final_hand.score).to eq(21)
    end

    it "should evaluate number cards correctly" do
      one_more_hand.calculate_hand
      expect(one_more_hand.score).to eq(16)
    end


    #   expect(crazy_hand.score).to_not eq(2)
    #   expect(diff_hand.score).to_not eq(3)
    #   expect(diff_hand.score).to_not eq(33)
    # end
  end
end
