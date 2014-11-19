require "sinatra"
require "slim"
require_relative "lib/life_game.rb"

# width = 80
# height = 60

helpers do
  def show_404
    status 404
    @page_title = '404'
    slim :'404'
  end
end

get '/' do
  @page_title = 'Home'
  slim :index
end

get '/bar' do
  @page_title = 'index'
  slim :bar
end

not_found do
  show_404
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
