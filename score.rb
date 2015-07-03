require './frame'
require './game'

game = Game.new ARGV[0]

puts game.get_score