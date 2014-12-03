require 'rubygems'
require 'sinatra'
require "slim"  

configure do
  set :port, 3000
end

helpers do
  def show_404
    status 404
    slim :'404'
  end
end

get '/' do
  @width = 900
  @height = 450
  slim :index
end

not_found do
  show_404
end


