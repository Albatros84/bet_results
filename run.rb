#!/usr/bin/ruby
require_relative "./database.rb"
require "./show_draw_bets_outcome.rb"


print "Enter Draw ID, you would like to see result for"
id = gets.chomp
puts "Selected option: #{id}"
draw=Draw.find(id)
puts "Enter 1 to see all results "
puts "Enter 2 to see only Won bets "
puts "Enter 3 to see only Lost bets "
b = gets.chomp
puts "Selected option: #{b}"

case b
when "1"
  puts "All bets for draw id #{draw.id}: "
  draw.bets.each do |bet|
    puts bet.show_possible_outcome
  end
when "2"
  puts "Searching only Won bets for draw id #{draw.id}: "
  draw.bets.each do |bet|
    if !bet.show_only_won.nil?
      puts bet.show_only_won 
    end  
  end
when "3"
  puts "Searching only Lost bets for draw id #{draw.id}: "
  draw.bets.each do |bet|
    if !bet.show_only_lost.nil?
      puts bet.show_only_lost
    end  
  end  
else
  puts "Option not recognized, enter 1, 2 or 3"
end  
