class Game
  attr_accessor :human_player_name, :enemies

  def initialize(human_player_name)
    @human_player = HumanPlayer.new(human_player_name)
    player1 = Player.new("Choupi")
    player2 = Player.new("Pô")
    player3 = Player.new("Jerry")
    player4 = Player.new("Groot")
    @enemies = [player1, player2, player3, player4]
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.empty? == false
      return true
    else 
      return false
    end
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.count} ennemis à abattre !"
  end

  def menu
    puts "-----------------------------------"
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme ?"
    puts "s - chercher à se soigner ?"
    puts
    puts "attaquer un joueur en vue :"
    @enemies.each.with_index do |enemy, position|
      print "#{position} - "
      enemy.show_state
    end
  end

  def menu_choice
    x = false
    while x = false
    puts
    print "> "  
    human_choice = gets.chomp

    if human_choice == "a"
      system("clear")
      @human_player.search_weapon
      x = true

    elsif human_choice == "s"
      system("clear")
      @human_player.search_health_pack
      x = true

    elsif human_choice == "0"
      system("clear")
      @human_player.attacks(player1)
      if player1.life_points < 0
        kill_player(player1)
      x = true
      end

    elsif human_choice == "1"
      system("clear")
      human1.attacks(player2)
      if player2.life_points < 0
        kill_player(player2)
      x = true
      end

    elsif human_choice == "2"
      system("clear")
      human1.attacks(player3)
      if player3.life_points < 0
        kill_player(player3)
      x = true
      end

    elsif human_choice == "3"
      system("clear")
      human1.attacks(player4)
      if player4.life_points < 0
        kill_player(player4)
      x = true
      end

    else
      puts "===================================================="
      puts "===================================================="
      puts "Ce n'est pas un choix valide, merci de recommencer :"
      puts "===================================================="
      puts "===================================================="
      x = false
    end
  end

  def enemies_attack
    @enemies.each do |enemy|
      if enemy.life_points > 0
      enemy.attacks(@human_player)
      end
    end
  end

  def end
    puts
    puts "-----------------------------------"
    puts
    puts "La partie est finie !"
    if @human_player.life_points > 0
      puts
      puts "Tu les as défoncé !"
    else
      puts
      puts "C'est ça qu'on appelle un champion... pfff... t'es qu'une merde et tu ne méritait pas de vivre..."
    end
  end

end