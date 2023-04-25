require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player_v2'

system("clear")
# Affichage et création de notre personnage !
puts "======================================================================================================="
puts "                              Bienvenue dans cette nouvelle édition de :"
puts
puts "=================================     ILS VEULENT TOUS MA POO !!     =================================="
puts "======================================================================================================="
puts "                     ------------------- Sponsorisé par Winnie ------------------"
puts
puts "===================================  IL NE PEUT EN RESTER QU'UN !   ==================================="
puts
puts
puts "Mais qui voilà ! Le champion s'avance ! Voici ... euh ... c'est quoi ton nom déjà ?..."
print "> "

human_player_name = gets.chomp.to_s
my_game = Game.new(human_player_name)

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end
my_game.end