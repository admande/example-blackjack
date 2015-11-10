require_relative 'deck'

class Hand
  attr_accessor :score

  def initialize(cards)
    @cards = cards
    @score = 0
  end

  # def calculate_hand
  #   @cards.each do |card|
  #     card.slice!(-1) #chop would be better?
  #   end
  #   @cards.each do |card|
  #     if @score <= 10 && card == "A"
  #         @score += 11
  #     else
  #         if card == "A"
  #           @score += 1
  #         elsif card == "K" || card == "Q" || card == "J"
  #           @score += 10
  #         else
  #           @score += card.to_i
  #         end
  #     end
  #   end
  # end

  def calculate_hand
    @cards.each do |card|
      if @score <= 10 && card.include?("A")
          @score += 11
      else
          if card.include?("A")
            @score += 1
          elsif card.include?("K") || card.include?("Q") || card.include?("J")
            @score += 10
          else
            @score += card.to_i #evaluates to i, regardless of symbol
          end
      end
    end
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_score # Get this working properly
