require 'rubygems'
require 'sinatra'
require "slim"  

configure do
  set :port, 4000
end

helpers do
  def show_404  
    status 404
    slim :'404'
  end
end

get '/' do
  @title = "Conway's Game of Life"
  @map_width = 1000
  @map_height = 500
  slim :index
end

not_found do
  show_404
end