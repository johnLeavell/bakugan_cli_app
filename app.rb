# app_runner.rb

require_relative 'player'
require_relative 'bakugan'
require_relative 'battle'

def get_user_input(prompt)
  print prompt
  gets.chomp.capitalize
end

def main
  player1_name = get_user_input("Player 1, what is your name? ")
  player2_name = get_user_input("Player 2, what is your name? ")

  player1 = Player.new(player1_name)
  player2 = Player.new(player2_name)

  battle = Battle.new(player1, player2)
  battle.run
end

main
