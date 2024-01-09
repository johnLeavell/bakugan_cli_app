# app_runner.rb

require_relative 'player'
require_relative 'bakugan'
require_relative 'battle'

def main
  prompt = TTY::Prompt.new
  player1_name = prompt.ask("Player 1, what is your name? "){ |q| q.modify :capitalize}
  player2_name = prompt.ask("Player 2, what is your name? "){ |q| q.modify :capitalize}

  player1 = Player.new(player1_name)
  player2 = Player.new(player2_name)

  battle = Battle.new(player1, player2)
  battle.run
end

main
