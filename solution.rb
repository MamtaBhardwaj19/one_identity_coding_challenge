require './lib/calculator.rb'

puts "Please enter input for e.g: 2&3/8 + 9/8"
input = gets.chomp

puts Calculator.new(input).result
