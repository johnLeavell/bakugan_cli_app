class Bakugan
    attr_accessor :name, :brawls_won
  
    def initialize(name)
      @name = name
      @brawls_won = 0
    end

    def simulate_match(opponet)
      rand(2).zero? ? self : opponet
    end
  end
  