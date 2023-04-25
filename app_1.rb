require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_v1'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Et nous voici réunis ici pour ce combat d'anthologie!"

while player1.life_points > 0 && player2.life_points > 0

puts
puts "==============================="
puts "Voici l'état des participants :"
puts "==============================="
puts

player1.show_state
player2.show_state

puts
puts "==============================="
puts "  Mettez-vous sur la gueule !"
puts "==============================="
puts

player1.attacks(player2)
if player2.life_points <= 0
  break
end
player2.attacks(player1)

end
# binding.pry

