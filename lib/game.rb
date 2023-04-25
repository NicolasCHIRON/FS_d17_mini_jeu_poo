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
      print "#{position + 1} - "
      enemy.show_state
    end
  end

  def menu_choice
    print "> "
    while input = gets.chomp.to_s.downcase
      break if (input == "a" || input == "s" || input == "1" || input == "2" || input == "3" || input == "4")
      puts "Ce choix n'est pas possible veuillez réessayer."
    end

    case input

    when "a"
      system("clear")
      @human_player.search_weapon
      
    when "s"
      system("clear")
      @human_player.search_health_pack

    when "1", "2", "3", "4"
      system("clear")
      input = input.to_i
      while input > @enemies.length
        puts "Cet ennemi est déjà mort... Laissez son cadavre tranquille et choisissez un nombre inférieur ou égal à #{@enemies.length}..."
        input = gets.chomp.to_i
      end
      @human_player.attacks(@enemies[input - 1])
      puts "-----------------"
      if @enemies[input - 1].life_points <= 0
        kill_player(@enemies[input - 1])
      end
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