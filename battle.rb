require 'tty-prompt'
class Battle
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def run
    display_welcome_message
    select_bakugans(@player1)
    select_bakugans(@player2)
    display_selected_bakugans
    display_begin_battle
  end

  private

  def display_welcome_message
    puts "Welcome to the Bakugan Battle Arena!"
  end

  def select_bakugans(player)
    puts "#{player.name}, use the spacebar to select 3 Bakugans:"
    choices = ['Dragonoid', 'Trox', 'Hammerhead', 'Ventri', 'Bruiser', 'Murph and Lil Jasper']
    selected_bakugans = TTY::Prompt.new.multi_select("Choose Bakugans:", choices, min: 3, max: 3)
    
    selected_bakugans.each do |bakugan_name|
      player.selected_bakugans << Bakugan.new(bakugan_name)
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

  def display_begin_battle
    puts "Let the battle begin!"
  end
end
