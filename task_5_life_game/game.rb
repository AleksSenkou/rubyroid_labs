require "simple_life_game"

width = 60
heigth = 40

life_game = LifeGame.new(width, heigth)

loop do
  system "clear"
  life_game.print_card
  sleep 0.1
  life_game.next_gen!
end
