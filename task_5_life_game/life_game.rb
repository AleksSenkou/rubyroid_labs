require "colorize"

game_card = []

class LifeGame
  def initialize(card_length = 40, card_heigth = 40)
    @card_length = card_length
    @card_heigth = card_heigth
    @card = Array.new(@card_heigth) { |i| Array.new(@card_length) { |j| j = rand(0..1) } }
  end

  def print_card
    @card.each { |line| line.each { |cell| print cell == 1 ? " ".light_blue : ' ' };
                        puts "\n" }
  end
end

life_game = LifeGame.new()

loop do
  system "clear"
  puts  " "*40 + "Game Life".green
  life_game.print_card
  sleep 0.15
end

