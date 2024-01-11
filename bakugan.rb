class Bakugan
  attr_accessor :name, :brawls_won, :player

  def initialize(name, player)
    @name = name
    @brawls_won = 0
    @player = player
  end

  def simulate_match(opponent)
    random_number = rand(1..100)

    if random_number.zero?
      self.brawls_won += 1
      player.wins += 1
    else
      opponent.brawls_won += 1
      opponent.player.wins += 1
    end
  end
end
