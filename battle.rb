require 'tty-prompt'

class Battle
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @prompt = TTY::Prompt.new
  end

  def run
    display_welcome_message
    select_bakugans(@player1)
    select_bakugans(@player2)
    display_selected_bakugans
    
    until overall_winner?
    begin_battle
    end

    declare_overall_winner
  end

  private

  def display_welcome_message
    puts "Welcome to the Bakugan Battle Arena!"
  end

  def select_bakugans(player)
    puts "#{player.name}, use the spacebar to select 3 Bakugans:"
    choices = ['Dragonoid', 'Trox', 'Hammerhead', 'Ventri', 'Bruiser', 'Murph and Lil Jasper']
    selected_bakugans = @prompt.multi_select("Choose Bakugans:", choices, min: 3, max: 3)
    
    selected_bakugans.each do |bakugan_name|
      bakugan = Bakugan.new(bakugan_name, player)
      player.selected_bakugans << bakugan
    end
  end

  def display_selected_bakugans
    puts "\nBakugans Selected:"
    display_player_bakugans(@player1)
    display_player_bakugans(@player2)
  end

  def display_player_bakugans(player)
    puts "#{player.name}'s Bakugans:"
    player.selected_bakugans.each do |bakugan|
      puts "- #{bakugan.name}"
    end
  end

  def begin_battle
    puts "Let the battle begin!"

    player1_bakugan = select_bakugan(@player1)
    player2_bakugan = select_bakugan(@player2)

    battle_result = simulate_battle(player1_bakugan, player2_bakugan)

    if battle_result
      puts "#{@player1.name}'s #{player1_bakugan.name} wins the match!"
      player1_bakugan.brawls_won += 1
      @player1.wins += 1
    else
      puts "#{@player2.name}'s #{player2_bakugan.name}  wins the match!"
      player2_bakugan.brawls_won += 1
      @player2.wins += 1
    end

    display_battle_results
  end

  def select_bakugan(player)
    puts "#{player.name}, select your Bakugan for this match:"
    display_player_bakugans(player)
  
    selected_bakugan_index = @prompt.select("Choose a Bakugan:", player.selected_bakugans.map(&:name))
    player.selected_bakugans.find { |bakugan| bakugan.name == selected_bakugan_index }
  end
  

  def simulate_battle(bakugan1, bakugan2)
    bakugan1.simulate_match(bakugan2)
  end

  def display_battle_results
    puts "\nBattle Results:"
    display_player_results(@player1)
    display_player_results(@player2)
  end

  def display_player_results(player)
    puts "#{player.name} - Wins: #{player.wins}"
    player.selected_bakugans.each do |bakugan|
      puts "- #{bakugan.name} - Brawls Won: #{bakugan.brawls_won}"
    end
  end

  def overall_winner?
    @player1.selected_bakugans.all? { |bakugan| bakugan.brawls_won >= 3 } || @player2.selected_bakugans.all? { |bakugan| bakugan.brawls_won >= 3 }
  end

  def declare_overall_winner
    if @player1.selected_bakugans.all? { |bakugan| bakugan.brawls_won >= 3 }
      puts "\nOverall Winner: #{@player1.name}"
    else
      puts "\nOverall Winner: #{@player2.name}"
    end
  end

end
