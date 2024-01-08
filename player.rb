class Player
    attr_accessor :name, :selected_bakugans, :wins
  
    def initialize(name)
      @name = name
      @selected_bakugans = []
      @wins = 0
    end
  end
  