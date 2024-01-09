# app_runner.rb
require 'artii'

require_relative 'player'
require_relative 'bakugan'
require_relative 'battle'

def display_welcome
  artii = Artii::Base.new(font: 'big', size: 3) 

  welcome_message = "Welcome to the Bakugan Battle Arena!"

  puts artii.asciify(welcome_message)
end

def main
  display_welcome
  prompt = TTY::Prompt.new
  player1_name = prompt.ask("Player 1, what is your name? "){ |q| q.modify :capitalize}
  player2_name = prompt.ask("Player 2, what is your name? "){ |q| q.modify :capitalize}

  player1 = Player.new(player1_name)
  player2 = Player.new(player2_name)

  battle = Battle.new(player1, player2)
  battle.run
end

main
