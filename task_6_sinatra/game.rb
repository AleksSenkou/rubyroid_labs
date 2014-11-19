require "sinatra"
require "slim"
require_relative "lib/life_game.rb"

width = 80
height = 60

# get ('/') { LifeGame.new(width, height) } 

get '/' do
  "<a href='/bar'>do something</a>"
end

get '/bar' do
  slim :index
end

not_found do
  'No such page.'
end


# width = 60 
# heigth = 40
# 
# life_game = LifeGame.new(width, heigth)
# 
# loop do
  # system "clear"
  # life_game.print_card
  # sleep 0.1
  # life_game.next_gen!
# end
