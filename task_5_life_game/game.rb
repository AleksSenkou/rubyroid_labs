require "simple_life_game"

width = 60
height = 40

life_game = LifeGame.new(width, height)

loop do
  system "clear"
  life_game.print_card
  sleep 0.1
  life_game.next_gen!
end
