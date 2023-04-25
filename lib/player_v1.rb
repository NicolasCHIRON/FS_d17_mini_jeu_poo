class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué comme une merde !"
    end
  end

  # Pour attaquer les autres joueurs en se servant du lancer de dé (compute damage) et de la perte de points de vie (gets_damage)
  def attacks(player2)
    puts "#{@name} tente de briser le genou de #{player2.name} !"
    attacks_power = compute_damage
    puts "Il lui inflige #{attacks_power} dégâts, la foule est en délire !"
    player2.gets_damage(attacks_power)
  end

  def compute_damage
    return rand(1..6)
  end

end