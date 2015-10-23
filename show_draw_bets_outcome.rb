#!/usr/bin/ruby


class Bet < ActiveRecord::Base
  belongs_to :market
  delegate :result, to: :market, prefix: true
  serialize :ball_selection, Array


  def show_possible_outcome
    (ball_selection - market_result).empty? ? "Bet id #{self.id} should be: Won" : "Bet id #{self.id} should be: Lost"
  end 


  def show_only_won
    "Bet id #{self.id} should be: Won" if (ball_selection - market_result).empty? 
  end
  

  def show_only_lost
    "Bet id #{self.id} should be: Lost" unless (ball_selection - market_result).empty? 
  end  
end




class Market < ActiveRecord::Base
  has_many :bets
  belongs_to :draw
end




class Market::BonusBall < Market

  def result
    draw.result + draw.bonus_result
  end


  def bonus_ball?
    true
  end
end




class Market::Accumulator < Market
  
  def result
    draw.result
  end
end




class Draw < ActiveRecord::Base
  has_many :markets, dependent: :destroy
  has_many :bets, through: :markets
  serialize :result, Array
  serialize :bonus_result, Array
end






