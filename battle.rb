require 'tty-prompt'
require_relative 'bakugan'

class Battle
  def initialize
    @prompt = TTY::Prompt.new
    @user1_name = nil
    @user2_name = nil
    @user1_bakugans = []
    @user2_bakugans = []
  end

  def run
    display_welcome_message
    get_user_names
    select_bakugans(@user1_name, @user1_bakugans)
    select_bakugans(@user2_name, @user2_bakugans)
    display_selected_bakugans
    display_begin_battle
  end

  private

  def display_welcome_message
    puts "Welcome to the Bakugan Battle Arena!"
  end

  def get_user_names
    puts "Player 1, what is your name?"
    @user1_name = gets.chomp.capitalize

    puts "Player 2, what is your name?"
    @user2_name = gets.chomp.capitalize
  end

  def select_bakugans(user_name, user_bakugans)
    puts "#{user_name}, use the spacebar to select 3 Bakugans:"
    choices = ['Dragonoid', 'Trox', 'Hammerhead', 'Ventri', 'Bruiser', 'Murph and Lil Jasper']
    selected_bakugans = @prompt.multi_select("Choose Bakugans:", choices, min: 3, max: 3)
    
    selected_bakugans.each do |bakugan_name|
      user_bakugans << Bakugan.new(bakugan_name)
    end
  end

  def display_selected_bakugans
    puts "\nBakugans Selected:"
    display_user_bakugans(@user1_name, @user1_bakugans)
    display_user_bakugans(@user2_name, @user2_bakugans)
  end

  def display_user_bakugans(user_name, user_bakugans)
    puts "#{user_name}'s Bakugans:"
    user_bakugans.each do |bakugan|
      puts "- #{bakugan.name}"
    end
  end

  def display_begin_battle
    puts "Let the battle begin!"
  end
end
