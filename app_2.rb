require 'bundler'
Bundler.require

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
human1 = HumanPlayer.new(human_player_name)
puts
puts "... bien sûr ! Voici #{human1.name} !!"

# On créé les adversaires !

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

# Boucle permettant de faire le combat
while human1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)



  # Boucle permettant de choisir l'action en fonction de la touche appuyée par le joueur
  x = false
  while x == false
  
  # Menu d'affichage d'action possible du joueur
    puts "-----------------------------------"
    human1.show_state
    puts "-----------------------------------"
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme ?"
    puts "s - chercher à se soigner ?"
    puts
    puts "attaquer un joueur en vue :"
    if player1.life_points > 0
    print "1 - "
    player1.show_state
    end
    if player2.life_points > 0
    print "2 - "
    player2.show_state
    puts "-----------------------------------"
    end

  # Conditions permettant de choisir l'action en fonction de la touche appuyée par le joueur
    puts
    print "> "  
    human_choice = gets.chomp

    if human_choice == "a"
      system("clear")
      human1.search_weapon
      x = true

    elsif human_choice == "s"
      system("clear")
      human1.search_health_pack
      x = true

    elsif human_choice == "1" && player1.life_points > 0
      system("clear")
      human1.attacks(player1)
      x = true

    elsif human_choice == "2" && player2.life_points > 0
      system("clear")
      human1.attacks(player2)
      x = true

    else
      puts "===================================================="
      puts "===================================================="
      puts "Ce n'est pas un choix valide, merci de recommencer :"
      puts "===================================================="
      puts "===================================================="
      x = false
    end

  end

  # Maintenant c'est au tour des adversaires de te frapper !

  enemies.each do |enemy|
    if enemy.life_points > 0
    enemy.attacks(human1)
    end
  end

end

# Quand la boucle est finie, le combat est terminé !

puts
puts "-----------------------------------"
puts
puts "La partie est finie !"
if human1.life_points > 0
  puts
  puts "Tu les as défoncé !"
else
  puts
  puts "C'est ça qu'on appelle un champion... pfff... t'es qu'une merde et tu ne méritait pas de vivre..."
end
# binding.pry

